class AuditionSerializer < ActiveModel::Serializer
  attributes :id, :time, :location, :date, :requested, :confirmed, :rejected, :role, :actor
  # has_one :actor
  # has_one :role
end
