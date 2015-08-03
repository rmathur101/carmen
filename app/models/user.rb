class User < ActiveRecord::Base
	has_secure_password

	has_one :api_key
	has_one :resident

	has_many :user_phones
	has_many :phones, through: :user_phones

end
