class AddUserIdToCharges < ActiveRecord::Migration[5.0]
  def change
    add_column :charges, :user_id, :integer
  end
end
