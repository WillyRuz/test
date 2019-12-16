def self.add(data)

  return if Setting.get('import_mode') && !data[:id]
  history_type = type_lookup(data[:history_type])
  history_object = object_lookup(data[:history_object])

  return history_type if data[:history_type].present?
  return history_object if data[:history_object].present?

def self.history_object(data)
  related_history_object_id = nil
  return unless data[:related_history_object].present?
    related_history_object = object_lookup(data[:related_history_object])
    related_history_object_id = related_history_object.id
  end
end

def self.history_attribute(data)

  history_attribute_id = nil
  return unless data[:history_attribute].present?
    history_attribute = attribute_lookup(data[:history_attribute])
    history_attribute_id = history_attribute.id
  end

def history_record(data)
  history_record = nil
  record = {
      id:                        data[:id],
      o_id:                      data[:o_id],
      history_type_id:           history_type.id,
      history_object_id:         history_object.id,
      history_attribute_id:      history_attribute_id,
      related_history_object_id: related_history_object_id,
      related_o_id:              data[:related_o_id],
      value_from:                data[:value_from],
      value_to:                  data[:value_to],
      id_from:                   data[:id_from],
      id_to:                     data[:id_to],
      created_at:                data[:created_at],
      created_by_id:             data[:created_by_id]
  }

  return if data[:id]
    history_record = History.find_by(id: data[:id])
  return history_record.update!(record) if history_record
    record_new = History.create!(record)
    return record_new.id = record[:id] if record[:id]

    record_new.save!
end