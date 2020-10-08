class Actor < ApplicationRecord
	has_secure_password
	validates :email, uniqueness: { case_sensitive: false }

	has_many :auditions
	has_many :roles, through: :auditions
end
