class UnexpectedResultException < ApiException
	module Codes
		DeletionUnsuccessful = 5001
	end

	HTTP_STATUS = 500

	def initialize(error_code, error_message, error_description)
		super(error_code, error_message, error_description, HTTP_STATUS)
	end
end