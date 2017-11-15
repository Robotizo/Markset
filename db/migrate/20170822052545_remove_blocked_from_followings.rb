class RemoveBlockedFromFollowings < ActiveRecord::Migration[5.0]
  def change
    remove_column :followings, :blocked, :boolean
  end
end
