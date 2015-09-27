class Api::SignUpsController < AuthController

	def index
		@resident = @user.resident
	end

	def create
		verify_create_params
		verify_create_param_values

		User.update(@user.id,
			first_name: params[:first_name],
			last_name: params[:last_name],
			email: params[:email]
		)
		Unit.update(@user.resident.unit.id,
			number: params[:unit_number]
		)
		# TODO: Remove this for resident. Keeping it for now
		# so we have a way to update it until the admin calls
		# are set up
		Address.update(@user.resident.address.id,
			street: params[:street],
			state: params[:state],
			city: params[:city],
			zip: params[:zip]
		)
		# TODO: Someday we want them to be able to add multiple phone numbers,
		# but for now we're only allowing one so we're clearing out all the phone
		# numbers before adding the new one
		@user.phones.clear
		@user.phones << Phone.create(number: params[:phone_number])
		@user.password = params[:new_password]
		@user.password_confirmation = params[:confirm_password]
		return @resident = User.find(@user.id).resident
	end

	private

	def verify_create_params
		verify_param_exists(:first_name)
		verify_param_exists(:last_name)
		verify_param_exists(:phone_number)
		verify_param_exists(:email)
		verify_param_exists(:confirm_email)
		verify_param_exists(:new_password)
		verify_param_exists(:confirm_password)
	end

	def verify_create_param_values
		User.validate_name(params[:first_name], "first name")
		User.validate_name(params[:last_name], "last name")
		User.validate_phone(params[:phone_number])
		User.validate_password(params[:new_password], params[:confirm_password])
		User.validate_email(params[:email], params[:confirm_email])
	end
end