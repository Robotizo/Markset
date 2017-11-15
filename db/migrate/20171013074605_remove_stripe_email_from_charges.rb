class RemoveStripeEmailFromCharges < ActiveRecord::Migration[5.0]
  def change
    remove_column :charges, :stripeEmail, :string
  end
end
