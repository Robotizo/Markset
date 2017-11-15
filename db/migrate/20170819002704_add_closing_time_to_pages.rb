class AddClosingTimeToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :closing_time, :time
  end
end
