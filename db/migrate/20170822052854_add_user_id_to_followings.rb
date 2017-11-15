class AddUserIdToFollowings < ActiveRecord::Migration[5.0]
  def change
    add_column :followings, :user_id, :integer
  end
end
