class AddPageIdToLineItems < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :page_id, :integer
  end
end
