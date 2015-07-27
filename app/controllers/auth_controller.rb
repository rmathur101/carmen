class AuthController < ApplicationController

		private

			def authenticate
				authenticate_or_request_with_http_token do |token, options|
					if ApiKey.exists?(access_token: token)
						@user = ApiKey.find_by(access_token: token).user
						return true
					end
				end
			end
			#TODO: what happens if authentication does not take place?

end





