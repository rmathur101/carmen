class Schedule < ActiveRecord::Base

	has_many :schedule_days
	has_many :days, through: :schedule_days

	belongs_to :car

	def self.validate_id(schedule_id)
		if !Schedule.exists?(id: schedule_id)
			raise NotFoundException.new(NotFoundException::Codes::InvalidId,
				"Unable to locate the schedule requested",
				"Schedule with ID #{schedule_id} doesn't exist in the database")
		end
	end

end
