class CreateResidentCars < ActiveRecord::Migration
  def change
    create_table :resident_cars do |t|
    	t.integer :car_id
    	t.integer :resident_id
      t.timestamps null: false
    end
  end
end
