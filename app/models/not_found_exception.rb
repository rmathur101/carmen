class NotFoundException < ApiException
	module Codes
		InvalidId = 4041
	end

	HTTP_STATUS = 404

	def initialize(error_code, error_message, error_description)
		super(error_code, error_message, error_description, HTTP_STATUS)
	end
end