class Api::SettingsController < AuthController
  def change_password
    verify_change_password_params
    verify_change_password_param_values

  	if @user.authenticate(params[:current_password])
	  	@user.password = params[:new_password]
			@user.password_confirmation = params[:confirm_password]
			@user.save

			render :nothing => true, :status => 204
  	else
  		raise InputValidationException.new(InputValidationException::Codes::IncorrectPassword, 
        "Current password is incorrect", 
        "Current password entered doesn't match the one stored in the database")
  	end
  end

  def index
  	@user
  end

  def update
    verify_update_params

  	@user.update(enable_notifications: params[:enable_notifications])
  end

  private

  def verify_change_password_params
    verify_param_exists(:current_password)
    verify_param_exists(:new_password)
    verify_param_exists(:confirm_password)
  end

  def verify_change_password_param_values
    User.validate_password(params[:new_password], params[:confirm_password])
  end

  def verify_update_params
    verify_param_exists(:enable_notifications)
  end
end
