class Api::CarsController < AuthController

	before_action :authenticate

	def index
		resident = @user.resident # @user data populated by authenticate
		@cars = resident.cars
	end



end
