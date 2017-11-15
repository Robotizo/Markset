class AddStripeTokenToCharges < ActiveRecord::Migration[5.0]
  def change
    add_column :charges, :stripeToken, :text
  end
end
