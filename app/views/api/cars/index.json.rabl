collection @cars => :cars
	attributes :model, :year, :color, :license, :id

child :status, :object_root => false do
	attribute :id => :status_id
	attribute :name => :status_name
end