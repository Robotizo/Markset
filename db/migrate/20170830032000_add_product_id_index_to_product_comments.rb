class AddProductIdIndexToProductComments < ActiveRecord::Migration[5.0]
  def change
  	add_index  :product_comments, :product_id
  end
end
