class Api::SignUpsController < ApplicationController
	def index
		#TODO: authenticate and retrieve user with token
		@resident = Resident.first
	end

	def create

	end
end
