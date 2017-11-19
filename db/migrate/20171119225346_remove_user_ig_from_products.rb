class RemoveUserIgFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :user_ig, :integer
  end
end
