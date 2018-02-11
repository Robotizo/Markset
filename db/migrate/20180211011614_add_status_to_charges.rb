class AddStatusToCharges < ActiveRecord::Migration[5.0]
  def change
    add_column :charges, :status, :string
  end
end
