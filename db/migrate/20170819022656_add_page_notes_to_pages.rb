class AddPageNotesToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :page_notes, :text
  end
end
