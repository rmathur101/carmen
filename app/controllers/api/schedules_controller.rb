class Api::SchedulesController < ApplicationController
	def index
		#TODO: authenticate and retrieve user with token
		resident = Resident.first
		@cars = resident.cars
	end
end
