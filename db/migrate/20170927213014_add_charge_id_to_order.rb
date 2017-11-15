class AddChargeIdToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :charge_id, :integer
  end
end
