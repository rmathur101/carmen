class CreateScheduleDays < ActiveRecord::Migration
  def change
    create_table :schedule_days do |t|
    	t.integer :schedule_id
    	t.integer :day_id
      t.timestamps null: false
    end
  end
end
