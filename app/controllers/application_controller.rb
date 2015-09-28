class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def verify_param_exists(param_to_verify)
		if (!params.has_key?(param_to_verify))
			param_name = param_to_verify.to_s
			raise RequestParametersException.new(RequestParametersException::Codes::MissingParams, 
				"Error with the request", 
				"Missing parameter '#{param_name}' from request")
		end
	end

	rescue_from ApiException do |exception|
    render_error(exception)
  end

  def render_error(exception)
		render json: {code: exception.error_code, 
									message: exception.error_message.capitalize, 
									description: exception.error_description}, 
									:status => exception.http_status
  end

end
