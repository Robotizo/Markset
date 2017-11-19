class DropCharges < ActiveRecord::Migration[5.0]
  def change
  	drop_table :charges
  end
end
