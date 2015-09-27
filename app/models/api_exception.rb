class ApiException < StandardError
	attr_reader(:error_code, :error_message, :error_description, :http_status)

	def initialize(error_code, error_message, error_description, http_status)
		super("API Exception occurred")
		@error_code = error_code
		@error_message = error_message
		@error_description = error_description
		@http_status = http_status
	end
end