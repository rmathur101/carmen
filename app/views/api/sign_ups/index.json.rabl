object @resident

glue :user do
	attributes :first_name, :last_name, :email
end

glue :unit do
	attributes :number, :max_cars
	glue :address do
		attributes :street, :state, :zip
	end
end


