class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
    	t.integer :car_id
    	t.time :time
    	t.boolean :is_active
    	t.boolean :is_recurring
      t.timestamps null: false
    end
  end
end
