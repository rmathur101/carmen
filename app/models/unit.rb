class Unit < ActiveRecord::Base
	belongs_to :building

	delegate :address, to: :building
end
