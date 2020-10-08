class Role < ApplicationRecord
  belongs_to :gig

  has_many :auditions
  has_many :actors, through: :auditions
end
