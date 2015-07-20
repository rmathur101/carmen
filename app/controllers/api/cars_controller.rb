class Api::CarsController < ApplicationController
	def index
		#TODO: authenticate and retrieve user with token
		resident = Resident.first
		print resident.cars
		@cars = resident.cars
	end
end
