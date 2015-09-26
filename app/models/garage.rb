class Garage < ActiveRecord::Base
	has_many :building_garages
	has_many :buildings, through: :building_garages
end
