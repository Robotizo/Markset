class AddOpeningTimeToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :opening_time, :time
  end
end
