class AddIndexToStoreOwners < ActiveRecord::Migration[5.0]
  def change
  	add_index :store_owners, :user_id
  end
end
