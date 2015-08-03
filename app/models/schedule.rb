class Schedule < ActiveRecord::Base

	has_many :schedule_days
	has_many :days, through: :schedule_days

	belongs_to :car

end
