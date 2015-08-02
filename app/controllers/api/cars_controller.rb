class Api::CarsController < AuthController

	def index
		# @user data populated by authenticate
		resident = @user.resident
		@cars = resident.cars
	end

	def create
		#need some way to put in checks that all of this information has been POSTED
		puts params[:model]
		puts params[:year]
		puts params[:color]
		puts params[:license]

		@user.resident.cars << Car.create(car_params)
		resident = @user.resident
		@cars = resident.cars
	end

	private

	#are we always guaranteed a :car? investigate.
	def car_params
		params.permit(:model, :year, :color, :license)
	end

end
