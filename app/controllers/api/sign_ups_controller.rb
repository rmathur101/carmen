class Api::SignUpsController < AuthController

	def index
		@resident = @user.resident
	end

	#Phone will be created for the first time here
	def create
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
		return @resident = User.find(@user.id).resident
	end

	private

	def sign_up_params
		params.permit(
			:first_name, #check
			:last_name, #check
			:street, #check
			:unit_number, #check
			:state, #check
			:city, #check
			:zip, #check
			:phone_number,
			:email,
			:confirm_email,
			:password,
			:confirm_password
		)
	end

end