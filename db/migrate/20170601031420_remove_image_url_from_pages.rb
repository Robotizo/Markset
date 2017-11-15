class RemoveImageUrlFromPages < ActiveRecord::Migration[5.0]
  def change
    remove_column :pages, :image_url, :string
  end
end
