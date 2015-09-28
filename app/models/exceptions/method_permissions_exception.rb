class MethodPermissionsException < ApiException
	module Codes
		RouteOnlyForValet = 4051
		RouteOnlyForAdmin = 4052
		RouteOnlyForResident = 4053
	end

	HTTP_STATUS = 405

	def initialize(error_code, error_message, error_description)
		super(error_code, error_message, error_description, HTTP_STATUS)
	end
end