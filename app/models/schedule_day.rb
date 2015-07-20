class ScheduleDay < ActiveRecord::Base
	belongs_to :schedule
	belongs_to :day
end
