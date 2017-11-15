class RemoveImageUrlFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :image_url, :string
  end
end
