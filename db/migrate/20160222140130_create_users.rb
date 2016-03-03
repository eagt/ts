class CreateUsers < ActiveRecord::Migration
  
  def up
    create_table :users do |t|
    	  t.string "name", :limit => 20, :null => false
        t.string "last_name", :limit =>20
        t.string "email", :default => "@", :null  => false
        t.string "password_digest"
        t.string "remember_digest"
        t.boolean "admin"
        t.string "activation_digest"
        t.boolean "activated", :default => false
        t.datetime "activated_at"

        t.string "reset_digest"
        t.datetime "reset_sent_at"

      t.timestamps null: false
    end
         add_index("users", "name")
         add_index :users, :email, unique: true
  end

  def down

    drop_table :users
    
  end

end
