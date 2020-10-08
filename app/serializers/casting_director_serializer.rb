class CastingDirectorSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password_digest, :agency, :address, :city, :state, :zip
end
