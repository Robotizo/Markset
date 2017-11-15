class DropSearchSuggestions < ActiveRecord::Migration[5.0]
  def change
  	drop_table :search_suggestions
  end
end
