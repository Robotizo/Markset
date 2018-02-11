class AddConfirmationToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :confirmation, :boolean
  end
end
