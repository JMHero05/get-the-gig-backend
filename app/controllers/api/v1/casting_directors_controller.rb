class Api::V1::CastingDirectorsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    render json: { casting_director: CastingDirectorSerializer.new(current_user) }, status: :accepted
  end

	def create
    @casting_director = CastingDirector.create(casting_director_params)
    if @casting_director.valid?
      @token = encode_token(user_id: @casting_director.id, admin: true)
      render json: { casting_director: CastingDirectorSerializer.new(@casting_director), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

	private
	
  def casting_director_params
    params.require(:casting_director).permit(:name, :email, :password, :agency, :address, :city, :state, :zip)
	end

end
