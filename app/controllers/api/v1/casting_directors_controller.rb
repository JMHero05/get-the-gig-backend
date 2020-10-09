class Api::V1::CastingDirectorsController < ApplicationController

	def create
    casting_director = CastingDirector.create(casting_director_params)
    if casting_director.valid?
      render json: { casting_director: CastingDirectorSerializer.new(casting_director) }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

	private
	
  def casting_director_params
    params.require(:casting_director).permit(:name, :email, :password, :agency, :address, :city, :state, :zip)
	end

end
