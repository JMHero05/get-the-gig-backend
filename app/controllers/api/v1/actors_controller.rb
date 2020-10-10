class Api::V1::ActorsController < ApplicationController
  skip_before_action :authorized, only: [:create]
	
	def create
    @actor = Actor.create(actor_params)
    if @actor.valid?
      @token = encode_token(user_id: @actor.id)
      render json: { actor: ActorSerializer.new(@actor), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

	private
	
  def actor_params
    params.require(:actor).permit(:first_name, :last_name, :gender, :image, :email, :password, :address, :city, :state, :zip)
	end
	
end
