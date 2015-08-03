class CreateUserPhones < ActiveRecord::Migration
  def change
    create_table :user_phones do |t|
    	t.integer :phone_id
    	t.integer :user_id
      t.timestamps null: false
    end
  end
end
