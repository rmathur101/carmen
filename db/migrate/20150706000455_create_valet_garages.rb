class CreateValetGarages < ActiveRecord::Migration
  def change
    create_table :valet_garages do |t|
    	t.integer :garage_id
    	t.integer :valet_id
      t.timestamps null: false
    end
  end
end
