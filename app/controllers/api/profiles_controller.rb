class Api::ProfilesController < AuthController
  def index
  	@resident = @user.resident
  end

  def edit
  	@user.update(first_name: update_profile_params[:first_name],
  		last_name: update_profile_params[:last_name],
  		email: update_profile_params[:email]
  	)
  	
  	#TODO: Update to handle multiple phone numbers. Currently, they can only have one phone number
  	@user.phones.first.update(number: update_profile_params[:phone_number])
  	@resident = @user.resident
  end

  def update_profile_params
	return params.permit(:first_name, :last_name, :phone_number, :email)
  end
end
