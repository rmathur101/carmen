class Api::CarsController < AuthController

	#this allows us to prevent the CSRF token authenticity error which is apparently only for requests from the browser - investigate; wonder how this would integrate with angular?
	skip_before_filter  :verify_authenticity_token

	before_action :authenticate

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
