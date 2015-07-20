collection @cars => :cars
	attributes :model, :year, :color, :license

child :schedules, :object_root => false do
	attributes :time, :is_active, :is_recurring
	child :days, :object_root => false do
		attributes :name
	end
end