class BuildingGarage < ActiveRecord::Base
	belongs_to :building
	belongs_to :garage

	has_many :building_garages_phones
	has_many :phones, through: :building_garages_phones

	delegate :name, to: :garage
end
