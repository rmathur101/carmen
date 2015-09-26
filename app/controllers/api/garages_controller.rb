class Api::GaragesController < AuthController
  def index
  	@garages = @user.resident.building.building_garages
  end
end
