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
		@schedule = Schedule.create(schedule_params)
		params[:days].each do |d|
			@schedule.schedule_days << ScheduleDay.create(day_id: d, schedule_id: @schedule.id)
		end
		scheduled_car.schedules << @schedule
	end

	def edit
		puts "I am here"
		puts params
		render json: "{data: ok}"
	end

	def delete
		render json: "{data: ok}"
	end

	private

	def schedule_params
		return params.permit(:name, :time, :is_active, :is_recurring)
	end

end
