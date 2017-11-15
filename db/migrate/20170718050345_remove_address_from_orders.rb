class RemoveAddressFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :address, :string
  end
end
