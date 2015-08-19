class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
    	t.integer :car_id
    	t.integer :resident_id
    	t.integer :valet_id
    	t.integer :building_id
    	t.integer :garage_id
    	t.integer :section_id
    	t.string :first_name
    	t.string :last_name
    	t.string :phone
    	t.string :email
      t.timestamps null: false
    end
  end
end
