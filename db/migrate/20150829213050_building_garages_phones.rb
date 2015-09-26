class BuildingGaragesPhones < ActiveRecord::Migration
  def change
  	create_table :building_garages_phones do |t|
			t.integer :phone_id
			t.integer :building_garage_id
			t.timestamps null: false  		
  	end
  end
end
