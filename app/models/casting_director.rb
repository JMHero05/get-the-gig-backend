class CastingDirector < ApplicationRecord
	has_secure_password
	validates :email, uniqueness: { case_sensitive: false }

	has_many :gigs
	has_many :roles, through: :gigs
end
