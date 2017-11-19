class DropPostAttachments < ActiveRecord::Migration[5.0]
  def change
  	drop_table :post_attachments
  end
end
