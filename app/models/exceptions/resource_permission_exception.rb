class ResourcePermissionException < ApiException
	module Codes
		ResourceNotOwnedByUser = 4031
	end

	HTTP_STATUS = 403

	def initialize(error_code, error_message, error_description)
		super(error_code, error_message, error_description, HTTP_STATUS)
	end
end