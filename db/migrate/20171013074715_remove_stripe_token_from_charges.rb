class RemoveStripeTokenFromCharges < ActiveRecord::Migration[5.0]
  def change
    remove_column :charges, :stripeToken, :text
  end
end
