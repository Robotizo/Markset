class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
    	t.integer	:product_id
     	t.integer	:cart_id
     	t.integer	:quantity,   default: 1
     	t.integer	:order_id
    	t.integer	:charge_id
    	t.integer	:payment_id
    	t.index		:cart_id
    	t.index		:product_id

     	t.timestamps
    end
  end
end
