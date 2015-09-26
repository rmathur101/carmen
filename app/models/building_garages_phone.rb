class BuildingGaragesPhone < ActiveRecord::Base
	belongs_to :phone
	belongs_to :building_garage
end