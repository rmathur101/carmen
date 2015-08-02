class Api::SignUpsController < AuthController

	def index
		@resident = @user.resident
	end

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
		return @resident = User.find(@user.id).resident
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

end