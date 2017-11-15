class AddOpeningDayToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :opening_day, :string
  end
end
