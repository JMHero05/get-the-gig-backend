class Api::V1::ActorsController < ApplicationController
  skip_before_action :authorized, only: [:create, :show, :auditions]

  require 'pry'

  def show
		actor = Actor.find(params[:id])
		render json: actor
	end
	
	def create
    @actor = Actor.create(actor_params)
    if @actor.valid?
      @token = encode_token(user_id: @actor.id, admin: false)
      render json: { actor: ActorSerializer.new(@actor), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def auditions
    actor = Actor.find(params[:id])
    auditions = Audition.where("actor_id = #{actor.id}")
    render json: auditions
  end

	private
	
  def actor_params
    params.require(:actor).permit(:first_name, :last_name, :gender, :image, :email, :password, :address, :city, :state, :zip)
	end
	
end
