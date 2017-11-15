class AddIntructionsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :instructions, :text
  end
end
