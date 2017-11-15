class DropFollows < ActiveRecord::Migration[5.0]
  def change
  	drop_table :follows
  end
end
