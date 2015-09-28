class ScheduleDay < ActiveRecord::Base
	belongs_to :schedule
	belongs_to :day

	def self.validate_id(schedule_day_id)
		if !ScheduleDay.exists?(id: schedule_day_id)
			raise NotFoundException.new(NotFoundException::Codes::InvalidId,
				"Issue with request",
				"Schedule day id #{schedule_day_id} doesn't exist in the database")
		end
	end
end
