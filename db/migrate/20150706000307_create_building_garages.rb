class CreateBuildingGarages < ActiveRecord::Migration
  def change
    create_table :building_garages do |t|
    	t.integer :building_id
    	t.integer :garage_id
    	t.string :email
    	t.timestamps null: false
    end
  end
end
