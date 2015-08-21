object @resident

glue :user do
	attributes :first_name, :last_name, :email
end

glue :unit do
	attributes :number => :unit_number, :max_cars => :max_cars
	glue :address do
		attributes :street, :city, :state, :zip
	end
end

child :phones, :object_root => false do
	attributes :number
end