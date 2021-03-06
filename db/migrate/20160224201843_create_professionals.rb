class CreateProfessionals < ActiveRecord::Migration

    def up

      create_table :professionals do |t|

        # Token to identify a register, not unique as it links instance for different users
       # t.string "id_token", :null => false

         t.string "id_code", :limit => 25

         t.string "discipline", :limit => 25
         t.string "first_name", :limit => 50, :null => false
         t.string "last_name", :limit => 50   #:null => false

        t.date "dob", :null => false, :default => Time.now
        t.string "email", :default => "@", :null => false
        t.integer "contact_details_id", :visible => false
        t.string "service", :limit => 25
        t.string "specialty", :limit => 25

        


        # In the next two columns I will leave the visible value while developing and testing...
        t.string "creator", :visible => true  # This has to be FILL IN automatically and kept on the data base depending who is the logger when creating it
                                               # It could be either Company or Professional. In the View  it has to be a dropdown with both ooptions.

        t.string "logged_as", :isible => true  # This has to be FILL IN automatically depending who is the logger in the current session
                                               # It would be deleted as soon as the user log off. Sort of virtual attribute.


        # It will be necessary to create usernames and password for each user. It may be that these usrnames and passwords
        # could be assigned to each branch independely by the global admin user in the company. It has to be taking
        # into account that the Branch Admin user won't be able to do CRUD in anything to do with the Company
             
        t.boolean "pass_active", :default => false 
        t.boolean "acc_active", :default => false  

        t.string "password_digest"
        t.string "remember_digest"

        t.datetime "last_in"

        t.boolean "is_virtual", :default => true
        #t.boolean "is_default", :default => false

        t.string "time_zone"

        t.timestamps null: false

      end
        #add_index :professionals, ["company_id", "id_code", "last_name", "service", "specialty", "dob","email"]
        
        add_index("professionals", "discipline")
        add_index("professionals", "id_code")
        add_index("professionals", "first_name")
        add_index("professionals", "last_name")
        add_index("professionals", "service")
        add_index("professionals", "specialty")
        add_index("professionals", "dob")
        add_index("professionals", "email")
         #add_index("professionals", "id_token")
    end


    def down
      drop_table :professionals

    end

end



 

   

