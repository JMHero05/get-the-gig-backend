class Api::V1::GigsController < ApplicationController
	skip_before_action :authorized
require 'pry'

	def index
		gigs = Gig.all
		render json: gigs
	end
	
	def show
		gig = Gig.find(params[:id])
		render json: gig
	end

	def create
		# binding.pry
		# dig_gig = gig_params.dig
		gig = Gig.create(gig_params)
		render json: gig.to_json
	end



	private

	def gig_params
    params.require(:gig).permit(:casting_director_id, :title, :gig_type, :union, :producer, :director, :choreographer, :music_director, :opening_date, :closing_date, :gig_location, :pay_rate, :audition_date, :audition_location)
	end
end
