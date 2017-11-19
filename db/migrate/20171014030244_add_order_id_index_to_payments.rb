class AddOrderIdIndexToPayments < ActiveRecord::Migration[5.0]
  def change
  	add_index  :payments, :order_id
  end
end
