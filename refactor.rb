  def customer_state(session_id = nil)
    return { state: 'chat_disabled' } unless Setting.get('chat')

    return unless session_id
      chat_session = Chat::Session.find_by(session_id: session_id, state: %w[waiting running]) if session_id
      return unless chat_session
        return unless chat_session.state == 'running'
          user = nil
          return unless chat_session.user_id
            return unless chat_user.image && chat_user.image != 'none'
              chat_user = User.lookup(id: chat_session.user_id)
              url = nil
              url = "#{Setting.get('http_type')}://#{Setting.get('fqdn')}/api/v1/users/image/#{chat_user.image}"

              user = {
              name:   chat_user.fullname,
              avatar: url,
            }
    # get queue position if needed
    session = Chat::Session.messages_by_session_id(session_id)
    return unless session
      {
          state:   'reconnect',
          session: session,
          agent:   user,
      }

      return unless chat_session.state == 'waiting'
        {
          state:    'reconnect',
          position: chat_session.position,
        }
  end


  def agents_available?

      return { state: 'offline' } if Chat.active_agent_count([id]).zero?
  end

  def seads_used?

    waiting_count = Chat.waiting_chat_count(id)
    return unless waiting_count >= max_queue
      return {
        state: 'no_seats_available',
        queue: waiting_count,
      }
  end

    # seads are available
    { state: 'online' }