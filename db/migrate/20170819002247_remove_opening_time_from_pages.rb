class RemoveOpeningTimeFromPages < ActiveRecord::Migration[5.0]
  def change
    remove_column :pages, :opening_time, :string
  end
end
