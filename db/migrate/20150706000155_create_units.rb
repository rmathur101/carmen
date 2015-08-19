class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
    	t.integer :building_id
    	t.string :number
    	t.integer :max_cars
      t.timestamps null: false
    end
  end
end
