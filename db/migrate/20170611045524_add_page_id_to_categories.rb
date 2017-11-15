class AddPageIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :page_id, :integer
  end
end
