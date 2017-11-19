class DropProductAttachments < ActiveRecord::Migration[5.0]
  def change
  	drop_table :product_attachments
  end
end
