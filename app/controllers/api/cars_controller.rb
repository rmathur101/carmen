class Api::CarsController < AuthController

	def index
		# @user data populated by authenticate
		resident = @user.resident
		@cars = resident.cars
	end

	def create
		#need some way to put in checks that all of this information has been POSTED
		@user.resident.cars << Car.create(cars_create_params)
		@cars = @user.resident.cars
	end

	def show
		puts "THIS IS THE THING"
		puts cars_show_params
		@car = Car.find(cars_show_params[:id])
	end

	def edit
		@car = Car.update(
			cars_edit_params[:id],
			model: cars_edit_params[:model],
			year: cars_edit_params[:year],
			color: cars_edit_params[:color],
			license: cars_edit_params[:license]
		)
	end

	def delete #needs to respond with a code if not success
		Car.delete(cars_delete_params[:id])
		render json: 'ok'
	end

	private

	def cars_create_params
		params.permit(:model, :year, :color, :license)
	end

	def cars_show_params
		params.permit(:id)
	end

	def cars_edit_params
		params.permit(:id, :model, :year, :color, :license)
	end

	def cars_delete_params
		params.permit(:id)
	end

end
