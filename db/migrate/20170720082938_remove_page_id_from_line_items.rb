class RemovePageIdFromLineItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :line_items, :page_id, :integer
  end
end
