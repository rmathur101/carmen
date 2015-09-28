class RequestParametersException < ApiException
	module Codes
		MissingParams = 4001
	end

	HTTP_STATUS = 400

	def initialize(error_code, error_message, error_description)
		super(error_code, error_message, error_description, HTTP_STATUS)
	end
end