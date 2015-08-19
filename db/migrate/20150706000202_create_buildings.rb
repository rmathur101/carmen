class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
    	t.integer :address_id
      t.timestamps null: false
    end
  end
end
