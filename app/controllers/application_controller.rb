class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_password_match
  		params.permit(
			:new_password,
			:confirm_password
		)
		if params[:new_password] == params[:confirm_password] && params[:new_password] && params[:new_password] && params[:confirm_password]
			return true
		else
			return false
		end
	end
end
