class CastingDirectorSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :agency, :address, :city, :state, :zip
  has_many :gigs
end
