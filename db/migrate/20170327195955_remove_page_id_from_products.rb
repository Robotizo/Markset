class RemovePageIdFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :page_id, :integer
  end
end
