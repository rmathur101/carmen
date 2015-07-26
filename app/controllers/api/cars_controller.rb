class Api::CarsController < AuthController

	before_action :authenticate

	def index
		#TODO: authenticate and retrieve user with token
		#1: read once over

		#NOTES
		#1 You can choose what actions you want to authenticate for
		#2 There seems to be some authentication action that has to be used
		#3 It is possible to use an except clause in the callback

		resident = Resident.first
		print resident.cars
		@cars = resident.cars
	end



end
