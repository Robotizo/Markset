class AddOrderIdIndexToCharges < ActiveRecord::Migration[5.0]
  def change
  	add_index  :charges, :order_id
  end
end
