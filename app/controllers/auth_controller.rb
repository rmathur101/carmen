class AuthController < ApplicationController

	#this allows us to prevent the CSRF token authenticity error which is apparently only for requests from the browser - investigate; wonder how this would integrate with angular?
	skip_before_filter  :verify_authenticity_token

	before_action :authenticate

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





