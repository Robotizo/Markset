class AddPageIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :page_id, :integer
  end
end
