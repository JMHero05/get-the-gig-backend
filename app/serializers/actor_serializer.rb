class ActorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :gender, :image, :email, :address, :city, :state, :zip
end
