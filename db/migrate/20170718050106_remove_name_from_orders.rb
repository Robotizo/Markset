class RemoveNameFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :name, :string
  end
end
