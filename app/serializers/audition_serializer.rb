class AuditionSerializer < ActiveModel::Serializer
  attributes :id, :time, :location, :date
  has_one :actor
  has_one :role
end
