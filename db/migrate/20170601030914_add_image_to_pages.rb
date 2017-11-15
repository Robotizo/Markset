class AddImageToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :image, :string
  end
end
