class RemoveNameFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :name, :string
  end
end
