class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_name
      t.integer :user_id
      t.date :order_date

      t.timestamps
    end
  end
end
