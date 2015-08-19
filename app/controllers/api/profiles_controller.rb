class Api::ProfilesController < AuthController
  def index
  	@resident = @user.resident
  end

  def edit
  end
end
