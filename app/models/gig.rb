class Gig < ApplicationRecord
  belongs_to :casting_director

  has_many :roles, :dependent => :destroy
  has_many :auditions, through: :casting_director
end
