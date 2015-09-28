class AuthController < ApplicationController

	#this allows us to prevent the CSRF token authenticity error which is apparently only for requests from the browser - investigate; wonder how this would integrate with angular?
	skip_before_filter  :verify_authenticity_token

	before_action :authenticate

		private

			def authenticate
				authenticate_token || render_token_missing
			end

			def authenticate_token
				authenticate_with_http_token do |token, options|
					if token.blank?
						raise UnauthorizedRequestException.new(UnauthorizedRequestException::Codes::TokenMissing, 
							"Error with authentication, please log out and log back in", 
							"No authentication token sent")
					elsif ApiKey.exists?(access_token: token)
						@user = ApiKey.find_by(access_token: token).user
						return true
					else
						raise UnauthorizedRequestException.new(UnauthorizedRequestException::Codes::TokenExpired, 
							"Error with authentication, please log out and log back in", 
							"Expired or invalid authentication token sent")
					end
				end
			end

			def render_token_missing
				raise UnauthorizedRequestException.new(UnauthorizedRequestException::Codes::TokenMissing, 
					"Error with authentication, please log out and log back in", 
					"No authentication token sent")
			end
end





