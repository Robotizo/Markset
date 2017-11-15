class AddInstructionsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :instructions, :string
  end
end
