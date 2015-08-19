class CreateValets < ActiveRecord::Migration
  def change
    create_table :valets do |t|
    	t.integer :user_id
    	t.string :type_of
      t.timestamps null: false
    end
  end
end
