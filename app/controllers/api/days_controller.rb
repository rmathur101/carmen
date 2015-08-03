class Api::DaysController < ApplicationController
  def index
	@days = Day.all
  end
end
