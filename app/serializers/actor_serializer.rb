class ActorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :gender, :image, :email, :password_digest, :address, :city, :state, :zip
end
