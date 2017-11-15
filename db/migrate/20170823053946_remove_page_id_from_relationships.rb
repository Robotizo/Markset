class RemovePageIdFromRelationships < ActiveRecord::Migration[5.0]
  def change
    remove_column :relationships, :page_id, :integer
  end
end
