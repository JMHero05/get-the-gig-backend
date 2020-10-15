class Api::V1::AuthController < ApplicationController
	skip_before_action :authorized, only: [:create_actor, :create_casting_director]

	require 'pry'

	def create_actor
		@actor = Actor.find_by(email: actor_login_params[:email])

		if @actor && @actor.authenticate(actor_login_params[:password])
			token = encode_token({ user_id: @actor.id, admin: false })
			render json: { actor: ActorSerializer.new(@actor), jwt: token }, status: :accepted
		else
			render json: { message: 'Invalid credentials for Actor. Try again, or log in as Casting Director' }, status: :unauthorized
		end
	end

	def create_casting_director
		@casting_director = CastingDirector.find_by(email: casting_director_login_params[:email])

		if @casting_director && @casting_director.authenticate(casting_director_login_params[:password])
			token = encode_token({ casting_director_id: @casting_director.id, admin: true })
			render json: { user: CastingDirectorSerializer.new(@casting_director), jwt: token }, status: :accepted
		else
			render json: { message: 'Invalid credentials for Casting Director. Try again, or log in as Actor' }, status: :unauthorized
		end
	end

	private

	def actor_login_params
		params.require(:actor).permit(:email, :password)
	end

	def casting_director_login_params
		params.require(:casting_director).permit(:email, :password)
	end

end
