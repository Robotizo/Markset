class AddPostIdToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :post_id, :integer
  end
end
