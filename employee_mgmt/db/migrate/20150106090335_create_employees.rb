class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :phone
      t.integer :salary, :default=>0

      t.timestamps null: false
    end
  end
end
