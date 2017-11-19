class AddOrderTimeToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :order_time, :string
  end
end
