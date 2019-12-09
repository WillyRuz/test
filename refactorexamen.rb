def ref_object_touch(record)
  return true if Setting.get('import_mode')

  member_ids = []
  organization_id_changed = record.saved_changes['organization_id']
  if organization_id_changed && organization_id_changed[0] != organization_id_changed[1]
    if organization_id_changed[0]
      unless User.where(organization_id: organization_id_changed[0]).count >= 100
        organization = Organization.find(organization_id_changed[0])
        organization.touch
        member_ids = organization.member_ids
      end
    end
  end
end

def id_incrementator(record, member_ids)
  if record.organization
    if User.where(organization_id: record.organization_id).count < 100
      record.organization.touch
      member_ids += record.organization.member_ids
    end
  end
end

def find_user(member_ids, record)
  member_ids.uniq.each do |user_id|
    next if user_id == record.id
    User.find(user_id).touch
  end
  true
end
