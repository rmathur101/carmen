class Api::SettingsController < AuthController
  def change_password

  	if @user.authenticate(params[:current_password])
	  	if check_password_match
	  		@user.password = params[:new_password]
			@user.password_confirmation = params[:confirm_password]
			@user.save

			render :nothing => true, :status => 204
		else
			render json: {errors: "Passwords do not match"}
	  	end
	else
		render json: {errors: "Incorrect current password"}
	end
  end

  def update
  end
end
