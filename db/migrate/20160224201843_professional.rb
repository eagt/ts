class Professional < ActiveRecord::Migration
  def up

    create_table :professionals do |t|

      t.string "id_code", :limit => 25
      t.string "name", :limit => 50, :null => false
      t.string "last_name", :limit => 50   #:null => false
      t.date "dob" #:null => false
      t.string "email", :default => "@", :null => false

      t.string "specialty", :limit => 25
      
      t.boolean "pass_active", :default => false 
      t.boolean "acc_active", :default => false  

      t.string "password_digest"
       t.string "remember_digest"
      t.datetime "last_in"

      t.timestamps null: false

    end
      add_index("professionals", "id_code")
      add_index("professionals", "last_name")
      add_index("professionals", "specialty")
      add_index("professionals", "dob")
      add_index("professionals", "email")
  
  end

  def down

    drop_table :professionals

  end

end
