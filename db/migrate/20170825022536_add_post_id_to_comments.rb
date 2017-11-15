class AddPostIdToComments < ActiveRecord::Migration[5.0]
  def change
  	add_column :comments, :post_id, :integer
    add_index  :comments, :post_id
  end
end
