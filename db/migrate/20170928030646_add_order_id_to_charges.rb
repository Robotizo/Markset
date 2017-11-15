class AddOrderIdToCharges < ActiveRecord::Migration[5.0]
  def change
    add_column :charges, :order_id, :integer
  end
end
