class RemoveStoreOwnerAgreementFromUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :store_owner_agreement, :boolean
  end
end
