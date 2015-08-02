class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
    	t.integer :phone_type_id
    	t.string :number
      t.timestamps null: false
    end
  end
end
