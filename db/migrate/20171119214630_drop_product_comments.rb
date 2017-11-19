class DropProductComments < ActiveRecord::Migration[5.0]
  def change
  	drop_table :product_comments
  end
end
