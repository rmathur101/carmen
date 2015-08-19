collection @schedules => :schedules
attribute :id => :schedule_id
attributes :name, :time, :is_active, :is_recurring

child :car, :object_root => false do
	attributes :model, :year, :color, :license, :id
end

child :days, :object_root => false do
	attribute :id => :day_id
end
