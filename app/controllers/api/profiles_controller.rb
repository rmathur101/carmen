class Api::ProfilesController < AuthController
  def index
  	@resident = @user.resident
  end

  def edit
    verify_edit_params
    verify_edit_param_values

  	@user.update(first_name: params[:first_name],
            		 last_name: params[:last_name],
            		 email: params[:email]
  	)
  	
  	#TODO: Update to handle multiple phone numbers. Currently, they can only have one phone number
  	@user.phones.first.update(number: params[:phone_number])
  	@resident = @user.resident
  end

  private
  def verify_edit_params
    verify_param_exists(:first_name)
    verify_param_exists(:last_name)
    verify_param_exists(:phone_number)
    verify_param_exists(:email)
    verify_param_exists(:confirm_email)
  end

  def verify_edit_param_values
    User.validate_name(params[:first_name], "first name")
    User.validate_name(params[:last_name], "last name")
    User.validate_phone(params[:phone_number])
    User.validate_email(params[:email], params[:confirm_email])
  end

  def update_profile_params
	return params.permit(:first_name, :last_name, :phone_number, :email)
  end
end
