class Api::SignUpsController < AuthController

	def index
		@resident = @user.resident
	end

	def create
		print params
		# User.update(@user.id, first_name: params[''])
		@resident = @user.resident
	end

	private

	def sign_up_params
		params.permit(
			:first_name,
			:last_name,
			:street,
			:unit_number,
			:state,
			:city,
			:zip,
			:phone_number,
			:email,
			:confirm_email
			:password,
			:confirm_password
			)
	end

end


# Headers
# Authorization

# Input Parameters
# first_name
# last_name
# street
# unit_number
# state
# city
# zip
# phone_number
# email
# confirm_email
# password TODO
# confirm_password TODO
# profile_image (optional) TODO

# Return Values (updated profile information)
# first_name
# last_name
# street
# unit_number
# state
# city
# zip
# phone_number
# email
# profile_image_url
