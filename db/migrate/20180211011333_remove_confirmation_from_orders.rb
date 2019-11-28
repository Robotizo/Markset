class RemoveConfirmationFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :confirmation, :boolean
  end
end
