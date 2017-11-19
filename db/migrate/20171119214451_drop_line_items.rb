class DropLineItems < ActiveRecord::Migration[5.0]
  def change
  	drop_table :line_items
  end
end
