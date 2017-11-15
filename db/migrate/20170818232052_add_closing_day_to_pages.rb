class AddClosingDayToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :closing_day, :string
  end
end
