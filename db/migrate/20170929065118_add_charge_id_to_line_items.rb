class AddChargeIdToLineItems < ActiveRecord::Migration[5.0]
  def change
  	add_column :line_items, :charge_id, :integer
  end
end
