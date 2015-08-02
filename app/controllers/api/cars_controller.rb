class Api::CarsController < AuthController

	def index
		# @user data populated by authenticate
		resident = @user.resident
		@cars = resident.cars
	end

	def create
		#need some way to put in checks that all of this information has been POSTED
		@user.resident.cars << Car.create(car_params)
		@cars = @user.resident.cars
	end

	private

	def car_params
		params.permit(:model, :year, :color, :license)
	end

end
