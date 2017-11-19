class DropCarts < ActiveRecord::Migration[5.0]
  def change
  	drop_table :carts
  end
end
