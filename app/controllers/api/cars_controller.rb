class Api::CarsController < AuthController

	def index
		# @user data populated by authenticate
		resident = @user.resident
		@cars = resident.cars
	end

	def create
		params = verify_create_params
		verify_create_param_values

		@car = Car.create(params)
		@user.resident.cars << @car

		return @car
	end

	def show
		verify_show_params
		verify_show_param_values

		@car = Car.find(params[:id])
	end

	def edit
		verify_edit_params
		verify_edit_param_values

		@car = Car.update(
			params[:id],
			model: params[:model],
			year: params[:year],
			color: params[:color],
			license: params[:license]
		)
	end

	def delete
		verify_delete_params
		verify_delete_param_values

		carId = params[:id]
		car = Car.find(carId)
		car = car.destroy

		if car.destroyed?
			render :nothing => true, :status => 204
		else
			raise UnexpectedResultException.new(UnexpectedResultException::Codes::DeletionUnsuccessful, 
				"Unable to delete car", 
				"There was an issue with deleting the car with id #{carId} from the database")
		end
	end

	private

	def verify_create_params
		verify_param_exists(:model)
		verify_param_exists(:year)
		verify_param_exists(:color)
		verify_param_exists(:license)
		params[:status_id] = 3

		return params.permit(:model, :year, :color, :license, :status_id)
	end

	def verify_create_param_values
		Car.validate_model(params[:model])
		Car.validate_year(params[:year])
		Car.validate_color(params[:color])
		Car.validate_license(params[:license])
	end

	def verify_edit_params
		verify_param_exists(:id)
		verify_param_exists(:model)
		verify_param_exists(:year)
		verify_param_exists(:color)
		verify_param_exists(:license)
	end

	def verify_edit_param_values
		Car.validate_id(params[:id])
		Car.validate_model(params[:model])
		Car.validate_year(params[:year])
		Car.validate_color(params[:color])
		Car.validate_license(params[:license])
	end

	def verify_show_params
		verify_param_exists(:id)
	end

	def verify_show_param_values
		Car.validate_id(params[:id])
	end

	def verify_delete_params
		verify_param_exists(:id)
	end

	def verify_delete_param_values
		Car.validate_id(params[:id])
	end
end
