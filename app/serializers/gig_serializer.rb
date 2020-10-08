class GigSerializer < ActiveModel::Serializer
  attributes :id, :title, :type, :union, :producer, :director, :choreographer, :music_director, :opening_date, :closing_date, :gig_location, :pay_rate, :audition_date, :audition_location, :roles
  has_one :casting_director
end
