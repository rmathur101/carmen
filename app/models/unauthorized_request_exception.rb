class UnauthorizedRequestException < ApiException
	module Codes
		TokenExpired = 4011
		TokenMissing = 4012
	end

	HTTP_STATUS = 401

	def initialize(error_code, error_message, error_description)
		super(error_code, error_message, error_description, HTTP_STATUS)
	end
end