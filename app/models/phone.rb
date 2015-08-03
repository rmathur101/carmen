class Phone < ActiveRecord::Base

	belongs_to :phone_type

	has_many :user_phones
	has_many :users, through: :user_phones

end
