class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
    	t.string   :pay_type
    	t.integer  :user_id
    	t.text     :instructions

    	t.timestamps
    end
  end
end
