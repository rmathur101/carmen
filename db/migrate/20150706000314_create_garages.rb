class CreateGarages < ActiveRecord::Migration
  def change
    create_table :garages do |t|
    	t.integer :address_id
    	t.string :name
      t.timestamps null: false
    end
  end
end
