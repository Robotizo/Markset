class RemoveChargeIdFromOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :charge_id, :integer
  end
end
