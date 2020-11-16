class RoleSerializer < ActiveModel::Serializer
  attributes :id, :role_type, :name, :description, :gender, :beg_age_range, :end_age_range
  has_one :gig
  has_many :auditions
end
