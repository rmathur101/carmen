class Api::SchedulesController < AuthController
	### Gets a list of all schedules associated to the user
	def index
		@schedules = @user.resident.schedules
	end

	### Gets information about a single schedule by ID
	def show
		@schedule = @user.resident.schedules.find(params[:id])
	end

	### Creates a new schedule
	def create
		scheduled_car = @user.resident.cars.find(params[:car_id])
		@schedule = Schedule.create(create_schedule_params)
		params[:days].each do |d|
			@schedule.schedule_days << ScheduleDay.create(day_id: d, schedule_id: @schedule.id)
		end
		scheduled_car.schedules << @schedule
	end

	def edit
		@schedule = @user.resident.schedules.find(params[:id])
		@schedule.update(update_schedule_params)
		@schedule.schedule_days.clear
		params[:days].each do |d|
			@schedule.schedule_days << ScheduleDay.create(day_id: d, schedule_id: @schedule.id)
		end
	end

	def delete
		schedule = @user.resident.schedules.find(params[:id])
		schedule = schedule.destroy
		if schedule.destroyed?
			render :nothing => true, :status => 204
		else
			render :nothing => true, :status => 500
		end
	end

	private

	def create_schedule_params
		return params.permit(:name, :time, :is_active, :is_recurring)
	end

	def update_schedule_params
		return params.permit(:name, :time, :car_id, :is_active, :is_recurring)
	end

end
