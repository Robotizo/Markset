class AddUserIdToStoreOwners < ActiveRecord::Migration[5.0]
  def change
    add_column :store_owners, :user_id, :integer
  end
end
