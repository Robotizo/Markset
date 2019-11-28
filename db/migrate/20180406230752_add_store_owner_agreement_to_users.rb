class AddStoreOwnerAgreementToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :store_owner_agreement, :boolean
  end
end
