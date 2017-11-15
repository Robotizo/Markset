class AddPageIdToRelationships < ActiveRecord::Migration[5.0]
  def change
    add_column :relationships, :page_id, :integer
  end
end
