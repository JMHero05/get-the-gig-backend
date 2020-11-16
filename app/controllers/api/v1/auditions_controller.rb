class Api::V1::AuditionsController < ApplicationController
	skip_before_action :authorized
	require 'pry'
	def create
		# binding.pry
		audition = Audition.create(audition_params)
		render json: audition
	end

	def update
		# binding.pry
		audition = Audition.find(params[:id])
		audition.update(audition_params)
		render json: audition
	end

	def actor_auditions
		auditions = Audition.where(params[:actor_id])
		render json: auditions
	end

	private

	def audition_params
		params.require(:audition).permit(:actor_id, :role_id, :time, :location, :date, :requested, :confirmed, :rejected)
	end
end
