class Api::SignUpsController < AuthController

	def index
		@resident = @user.resident
	end

	def create
		if check_password_match(sign_up_params)
			User.update(@user.id,
				first_name: sign_up_params[:first_name],
				last_name: sign_up_params[:last_name]
			)
			Unit.update(@user.resident.unit.id,
				number: sign_up_params[:unit_number]
			)
			Address.update(@user.resident.address.id,
				street: sign_up_params[:street],
				state: sign_up_params[:state],
				city: sign_up_params[:city],
				zip: sign_up_params[:zip]
			)
			phone = Phone.create(number: sign_up_params[:phone_number])
			UserPhone.create(user_id: @user_id, phone_id: phone.id)
			@user.password = sign_up_params[:password]
			@user.password_confirmation = sign_up_params[:confirm_password]
			return @resident = User.find(@user.id).resident
		else
			render json: {errors: "Passwords do not match"}
		end
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
			:confirm_email,
			:password,
			:confirm_password
		)
	end

	def check_password_match(params)
		if params[:password] == params[:confirm_password] && params[:password] && params[:password] && params[:confirm_password]
			return true
		else
			return false
		end
	end

end