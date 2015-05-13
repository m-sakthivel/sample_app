class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :employee_name
      t.integer :employee_id
      t.text :employee_address
       
      t.timestamps
    end
  end
end
