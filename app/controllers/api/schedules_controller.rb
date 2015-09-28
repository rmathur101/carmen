class Api::SchedulesController < AuthController
	### Gets a list of all schedules associated to the user
	def index
		@schedules = @user.resident.schedules
	end

	### Gets information about a single schedule by ID
	def show
		verify_show_params
		verify_show_param_values

		@schedule = Schedule.find(params[:id])
	end

	### Creates a new schedule
	def create
		verify_create_params
		verify_create_param_values

		@schedule = Schedule.create(name: params[:name],
																time: params[:time],
																is_active: params[:is_active],
																is_recurring: params[:is_recurring])
		params[:days].each do |d|
			@schedule.schedule_days << ScheduleDay.create(day_id: d, schedule_id: @schedule.id)
		end

		scheduled_car = Car.find(params[:car_id])
		scheduled_car.schedules << @schedule
	end

	### Edits an existing schedule
	def edit
		verify_edit_params
		verify_edit_param_values

		@schedule = Schedule.find(params[:id])
		@schedule.update(name: params[:name],
										 time: params[:time],
										 is_active: params[:is_active],
										 is_recurring: params[:is_recurring],
										 car_id: params[:car_id])

		@schedule.schedule_days.clear
		params[:days].each do |d|
			@schedule.schedule_days << ScheduleDay.create(day_id: d, schedule_id: @schedule.id)
		end
	end

	### Deletes an existing schedule
	def delete
		verify_delete_params
		verify_delete_param_values

		scheduleId = params[:id]
		schedule = Schedule.find(params[:id])
		schedule = schedule.destroy

		if schedule.destroyed?
			render :nothing => true, :status => 204
		else
			raise UnexpectedResultException.new(UnexpectedResultException::Codes::DeletionUnsuccessful, 
				"Unable to delete schedule", 
				"There was an issue with deleting the schedule with id #{scheduleId} from the database")
		end
	end

	private

	def verify_show_params
		verify_param_exists(:id)
	end

	def verify_show_param_values
		Schedule.validate_id(params[:id])
	end

	def verify_create_params
		verify_param_exists(:car_id)
		verify_param_exists(:days)
		verify_param_exists(:name)
		verify_param_exists(:time)
		verify_param_exists(:is_active)
		verify_param_exists(:is_recurring)
	end

	def verify_create_param_values
		Car.validate_id(params[:car_id])
		params[:days].each do |d|
			ScheduleDay.validate_id(d)
		end
	end

	def verify_edit_params
		verify_param_exists(:car_id)
		verify_param_exists(:days)
		verify_param_exists(:name)
		verify_param_exists(:time)
		verify_param_exists(:is_active)
		verify_param_exists(:is_recurring)
	end

	def verify_edit_param_values
		Schedule.validate_id(params[:id])
		Car.validate_id(params[:car_id])
		params[:days].each do |d|
			ScheduleDay.validate_id(d)
		end
	end

	def verify_delete_params
		verify_param_exists(:id)
	end

	def verify_delete_param_values
		Schedule.validate_id(params[:id])
	end

end
