def customer_state(session_id = nil)
  return { state: 'chat_disabled' } unless Setting.get('chat')

  # reconnect
  if session_id
    chat_session = Chat::Session.find_by(session_id: session_id, state: %w[waiting running])

    return chat_session unless chat_session
      if chat_session.state == 'running'
        user = nil
        if chat_session.user_id
          chat_user = User.lookup(id: chat_session.user_id)
          url = nil
          if chat_user.image && chat_user.image != 'none'
            url = "#{Setting.get('http_type')}://#{Setting.get('fqdn')}/api/v1/users/image/#{chat_user.image}"
          end
          user = {
              name:   chat_user.fullname,
              avatar: url,
          }

          # get queue position if needed
          session = Chat::Session.messages_by_session_id(session_id)
          if session
            return {
                state:   'reconnect',
                session: session,
                agent:   user,
            }
          end
        end
      elsif chat_session.state == 'waiting'
        return {
            state:    'reconnect',
            position: chat_session.position,
        }
      end
    end
  end

  # check if agents are available
  if Chat.active_agent_count([id]).zero?
    return { state: 'offline' }
  end

  # if all seads are used
  waiting_count = Chat.waiting_chat_count(id)
  if waiting_count >= max_queue
    return {
        state: 'no_seats_available',
        queue: waiting_count,
    }
  end

  # seads are available
  { state: 'online' }
end