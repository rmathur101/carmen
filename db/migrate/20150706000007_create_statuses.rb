class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
    	t.integer :name
      t.timestamps null: false
    end
  end
end
