class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.integer :present
      t.integer :absent
      t.integer :sick_leave
      t.integer :day_off

      t.timestamps
    end
  end
end
