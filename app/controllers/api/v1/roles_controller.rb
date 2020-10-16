class Api::V1::RolesController < ApplicationController
	skip_before_action :authorized

	def create
		role = Role.create(role_params)
		render json: role
	end

	private

	def role_params
		params.require(:role).permit(:gig_id, :role_type, :name, :description, :gender, :beg_age_range, :end_age_range)
	end

end