class Car < ActiveRecord::Base
	belongs_to :status
	
	has_many :schedules

	def self.validate_id(car_id)
		if !Car.exists?(id: car_id)
			raise NotFoundException.new(NotFoundException::Codes::InvalidId,
				"Unable to locate the car requested",
				"Car with ID #{car_id} doesn't exist in the database")
		end
	end

	def self.validate_model(model)
		if model.blank?
			raise InputValidationException.new(InputValidationException::Codes::RequiredValuesNotPresent, 
				"Car model is required", 
				"Length of the model value must be greater than zero")
		end
	end

	def self.validate_year(year)
		if !year.match(/^\d+$/)
			raise InputValidationException.new(InputValidationException::Codes::InvalidChars, 
				"Car year must only contain digits", 
				"The year value must be sent with only digits")
		end
	end

	def self.validate_color(color)
		if color.blank?
			raise InputValidationException.new(InputValidationException::Codes::RequiredValuesNotPresent, 
				"Car color is required", 
				"Length of the color value must be greater than zero")
		end
	end

	def self.validate_license(license)
		if license.blank?
			raise InputValidationException.new(InputValidationException::Codes::RequiredValuesNotPresent, 
				"License plate number is required", 
				"Length of the license value must be greater than zero")
		end
	end
end
