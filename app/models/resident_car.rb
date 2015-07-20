class ResidentCar < ActiveRecord::Base
	belongs_to :car
	belongs_to :resident
end
