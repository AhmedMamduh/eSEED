class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.integer :mobile
      t.date :hire_date

      t.timestamps
    end
  end
end
