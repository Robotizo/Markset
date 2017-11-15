class RemovePayTypeFromCharges < ActiveRecord::Migration[5.0]
  def change
    remove_column :charges, :pay_type, :string
  end
end
