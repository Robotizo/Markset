class RemoveInstructionsFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :instructions, :string
  end
end
