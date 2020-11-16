class Role < ApplicationRecord
  belongs_to :gig

  has_many :auditions, :dependent => :destroy
  has_many :actors, through: :auditions
end
