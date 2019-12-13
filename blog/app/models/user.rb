class User
  include Mongoid::Document
  field :email, type: String
  field :name, type: String
  field :last_name, type: String
  field :mobile_phone, type: String
  field :work_place, type: String

  validates :email, presence: true
  validates :name, presence: true
  validates :last_name, presence: true
  validates :mobile_phone, presence: true
  validates :work_place, presence: true
end
