class CreateBuildingGarages < ActiveRecord::Migration
  def change
    create_table :building_garages do |t|
    	t.integer :building_id
    	t.integer :garage_id
      t.timestamps null: false
    end
  end
end
