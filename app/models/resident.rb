class Resident < ActiveRecord::Base

	has_many :resident_cars
	has_many :cars, through: :resident_cars
	has_many :schedules, through: :cars

	belongs_to :user
	belongs_to :unit

	delegate :address, to: :unit
	delegate :phones, to: :user

	# def schedules
	# 	return Schedule.where("car_id = ?", self.cars.map { |car| car.id })
	# end

end
