class CreateStoreOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :store_owners do |t|
      t.string :store_owner_agreement

      t.timestamps
    end
  end
end
