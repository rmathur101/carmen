collection @garages => :garages

attributes :name, :email

child :phones, :object_root => false do
	attribute :number => :phone_number
end
