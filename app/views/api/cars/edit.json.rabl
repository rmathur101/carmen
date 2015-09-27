object @car

attributes :model, :year, :color, :license

child :status, :object_root => false do
	attribute :id => :status_id
	attribute :name => :status_name
end