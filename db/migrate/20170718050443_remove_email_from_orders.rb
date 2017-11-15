class RemoveEmailFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :email, :string
  end
end
