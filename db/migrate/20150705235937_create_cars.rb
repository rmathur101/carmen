class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
    	t.integer :garage_id
    	t.integer :section_id
    	t.integer :status_id
    	t.string :model
    	t.integer :year
    	t.string :color
    	t.string :license
      t.timestamps null: false
    end
  end
end
