class AddAccessOptionsToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :access_options, :string
  end
end
