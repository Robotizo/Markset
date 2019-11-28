class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
	    t.string   :title
	    t.text     :description
	    t.string   :genre
	    t.integer  :user_id
	    t.string   :image
	    t.string   :opening_day
	    t.string   :closing_day
	    t.time     :opening_time
	    t.time     :closing_time
	    t.text     :page_notes


	    t.timestamps
    end
  end
end
