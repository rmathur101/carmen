class Building < ActiveRecord::Base
	belongs_to :address

	has_many :building_garages
	has_many :garages, through: :building_garages
end
