class User < ActiveRecord::Base
	has_secure_password

	has_one :api_key
	has_one :resident

	has_many :user_phones
	has_many :phones, through: :user_phones


	def self.validate_password(new_password, confirm_password)
		if new_password != confirm_password
			raise InputValidationException.new(InputValidationException::Codes::FieldsMustMatch,
				"Password and confirm password do not match",
				"The new password and confirm password fields do not match")
		end

		if new_password.blank?
			raise InputValidationException.new(InputValidationException::Codes::RequiredValuesNotPresent, 
				"A password is required", 
				"Length of the password and confirm_password values must be greater than zero")
		end

		if new_password.length < 8
			raise InputValidationException.new(InputValidationException::Codes::MinLengthNotMet, 
				"Password must be at least 8 characters long", 
				"The minimum required length for a password is 8 characters")
		end

		if new_password.length > 25
			raise InputValidationException.new(InputValidationException::Codes::GreaterThanMaxLength, 
				"Password must be less than 25 characters long", 
				"The maximum allowed length for a password is 25 characters")
		end

		# Validate the password complexity
		password_complexity_count = 0
		# At least one uppercase letter
		if new_password.match(/[A-Z]+/)
			password_complexity_count += 1
		end 
		# At least one lowercase letter
		if new_password.match(/[a-z]+/)
			password_complexity_count += 1
		end
		# At least one number
		if new_password.match(/\d+/)
			password_complexity_count += 1
		end
		# At least one special character
		if new_password.match(/[!@#$%&*]+/)
			password_complexity_count += 1
		end

		if password_complexity_count < 3
			raise InputValidationException.new(InputValidationException::Codes::NotAllRequiredCharsUsed, 
				"Password must use at least three of following character types: lowercase letters, uppercase letters, numbers, symbols (!@#$%&*)", 
				"Password is not complex enough")
		end
	end

	def self.validate_email(email, confirm_email)
		if email != confirm_email
			raise InputValidationException.new(InputValidationException::Codes::FieldsMustMatch,
				"Email and confirm email do not match",
				"The email and confirm email fields do not match")
		end

		if email.blank?
			raise InputValidationException.new(InputValidationException::Codes::RequiredValuesNotPresent, 
				"Your email is required", 
				"Length of the email and confirm_email values must be greater than zero")
		end

		if !email.strip.match(/^\S+@{1}\S+\.{1}\S+$/)
			raise InputValidationException.new(InputValidationException::Codes::FormatInvalid, 
				"Please enter a vaild e-mail address", 
				"The e-mail address needs at least one '@' and one '.' surrounded by non-whitespace characters")
		end
	end

	def self.validate_phone(phone_number)
		# phone_number = phone_number.gsub(/\D/, '')

		if phone_number.blank?
			raise InputValidationException.new(InputValidationException::Codes::RequiredValuesNotPresent, 
				"Your phone number is required", 
				"Length of the phone_number value must be greater than zero")
		end

		if !phone_number.match(/^\d+$/)
			raise InputValidationException.new(InputValidationException::Codes::InvalidChars, 
				"Phone number must only contain digits", 
				"The phone_number value must be sent with only digits")
		end
	end

	def self.validate_name(name, name_description)
		# Length must be greater than zero
		if name.blank?
			raise InputValidationException.new(InputValidationException::Codes::RequiredValuesNotPresent, 
				"#{name_description} is required", 
				"Length of the #{name_description} value must be greater than zero")
		end
	end
end
