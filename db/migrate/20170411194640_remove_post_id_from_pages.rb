class RemovePostIdFromPages < ActiveRecord::Migration[5.0]
  def change
    remove_column :pages, :post_id, :integer
  end
end
