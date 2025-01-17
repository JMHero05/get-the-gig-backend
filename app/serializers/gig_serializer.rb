class GigSerializer < ActiveModel::Serializer
  attributes :id, :title, :gig_type, :union, :producer, :director, :choreographer, :music_director, :opening_date, :closing_date, :gig_location, :pay_rate, :audition_date, :audition_location
  has_one :casting_director
  has_many :roles
end
