class ApplicationController < ActionController::API
	before_action :authorized

	def encode_token(payload)
		JWT.encode(payload, Figaro.env.jwt_secret)
	end

	def auth_header
		request.headers['Authorization']
	end

	def decoded_token
		if auth_header
			token = auth_header.split(' ')[1]
			begin
				JWT.decode(token, Figaro.env.jwt_secret, true, algorithm: 'HS256')
			rescue JWT::DecodeError
				nil
			end
		end
	end

	def current_user
		if decoded_token
			if decoded_token[0]['admin']
				casting_director_id = decoded_token[0]['casting_director_id']
				@user = CastingDirector.find_by(id: casting_director_id)
			else
				actor_id = decoded_token[0]['actor_id']
				@user = Actor.find_by(id: actor_id)
			end
		end
	end

	def logged_in?
		!!current_user
	end

	def authorized
		render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
	end

end
