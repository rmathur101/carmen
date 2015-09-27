class InputValidationException < ApiException
	module Codes
		RequiredValuesNotPresent = 4221
		MinLengthNotMet = 4222
		GreaterThanMaxLength = 4223
		InvalidChars = 4224
		NotAllRequiredCharsUsed = 4225
		FormatInvalid = 4226
		FieldsMustMatch = 4227
	end

	HTTP_STATUS = 422

	def initialize(error_code, error_message, error_description)
		super(error_code, error_message, error_description, HTTP_STATUS)
	end
end