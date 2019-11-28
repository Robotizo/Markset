class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
	    t.string   :name
	    t.string   :password_digest
	    t.string   :image
	    t.string   :email
	    t.string   :username
	    t.string   :auth_token
	    t.index	:username, unique: true

	    t.timestamps

    end
  end
end
