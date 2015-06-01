class AddLatAndLongToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :lat, :float
    add_column :orders, :long, :float
  end
end
