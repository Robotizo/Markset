class CreateProductComments < ActiveRecord::Migration[5.0]
  def change
    create_table :product_comments do |t|
	   	t.integer  :user_id
	    t.integer  :product_id
	    t.text     :content
	    t.index :product_id

	    t.timestamps
    end
  end
end
