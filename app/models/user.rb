class User < ActiveRecord::Base

	has_one :api_key
	has_one :resident


end
