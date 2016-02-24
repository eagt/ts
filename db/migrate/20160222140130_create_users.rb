class CreateUsers < ActiveRecord::Migration
  
  def up
    create_table :users do |t|
    	  t.string "first_name", :limit => 20, :null => false
        t.string "last_name", :limit =>20
        t.string "email", :default => "@", :null  =>false
        t.string "password_digest"

      t.timestamps null: false
    end
         add_index("users", "first_name")
         add_index :users, :email, unique: true
  end

  def down

    drop_table :users
    
  end

end
