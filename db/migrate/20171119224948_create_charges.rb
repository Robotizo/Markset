class CreateCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :charges do |t|
	    t.integer  :order_id
	    t.integer  :user_id
	    t.index :order_id

	    t.timestamps
    end
  end
end
