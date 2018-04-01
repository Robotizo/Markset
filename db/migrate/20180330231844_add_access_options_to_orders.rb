class AddAccessOptionsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :access_options, :string
  end
end
