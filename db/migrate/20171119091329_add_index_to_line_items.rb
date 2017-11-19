class AddIndexToLineItems < ActiveRecord::Migration[5.0]
  def change
  	add_index :line_items, :cart_id
  	add_index :line_items, :product_id
  end
end
