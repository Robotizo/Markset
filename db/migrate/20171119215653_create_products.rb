class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
    	t.string :title
	    t.text :description
	    t.string :image_url
	    t.decimal :price, precision: 8, scale: 2
	    t.integer  :page_id
    	t.integer  :category_id
    	t.integer  :user_ig
    	t.string   :status

	    t.timestamps
    end
  end
end
