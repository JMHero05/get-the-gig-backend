class CastingDirectorSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :agency, :address, :city, :state, :zip
end
