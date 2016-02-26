class CreateCompanies < ActiveRecord::Migration

  def up

    create_table :companies do |t|

        t.string "id_code", :limit => 25
        t.string "company", :limit => 50, :null => false
        t.string "email", :default => "@", :null => false

# Below, once it's especified that the Head Quarter has been created, the system
# will show the rest as branches unless somethng else is specified.

        t.boolean "head_quarter", :default => false
        t.boolean "branch", :default => false
        
        t.boolean "pass_active", :default => false
        t.boolean "acc_active", :default => false

        t.string "password_digest"
        t.datetime "last_in"

        t.timestamps null: false
    end

        add_index("companies", "company")
        add_index("companies", "email")
        add_index("companies", "head_quarter")
  
  end


  def down

    drop_table :companies

  end

end