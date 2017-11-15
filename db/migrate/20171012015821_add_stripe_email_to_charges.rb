class AddStripeEmailToCharges < ActiveRecord::Migration[5.0]
  def change
    add_column :charges, :stripeEmail, :string
  end
end
