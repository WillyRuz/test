def assets(data)
  app_model = self.class.to_app_model

  data[app_model] = {} unless data[app_model]
  unless data[app_model][id]
    local_attributes = attributes_with_association_ids

    local_attributes['object'] = ObjectLookup.by_id(local_attributes['activity_stream_object_id'])
    local_attributes['type'] = TypeLookup.by_id(local_attributes['activity_stream_type_id'])

    data[app_model][id] = local_attributes

    ApplicationModel.assets_of_object_list([local_attributes], data)
  end
end

def assign_to_user(data)
  return data unless self['created_by_id']

  app_model_user = User.to_app_model
  %w[created_by_id].each do |local_user_id|
    next unless self[local_user_id]
    next if data[app_model_user] && data[app_model_user][self[local_user_id]]

    user = User.lookup(id: self[local_user_id])
    next unless user

    data = user.assets(data)
  end
  data
end