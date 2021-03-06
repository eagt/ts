class CreateCompanies < ActiveRecord::Migration

def up

    create_table :companies do |t|

     
        
        t.string "id_code", :limit => 25
        t.string "discipline", :limit => 25
        t.string "name", :limit => 50, :null => false
        t.string "email", :default => "@", :null => false

        t.integer "contact_details_id", :visible => false
        t.string "service", :limit => 25
        t.string "specialty", :limit => 50      #, :null => false

          # In the next two columns I will leave the visible value while developing and testing...
        t.string "creator", :visible => true  # This has to be FILL IN automatically and kept on the data base depending who is the logger when creating it
                    # It could be either Company or Professional. In the View  it has to be a dropdown with both ooptions.

        t.string "logged_as", :visible => true  # This has to be FILL IN automatically depending who is the logger in the current session
                      # It would be deleted as soon as the user log off. Sort of virtual attribute.


        # Below, once it's especified that the Head Quarter has been created, the system
        # will show the rest as branches unless somethng else is specified. In the view must be 
        # a button to link to create new branch once it is inside a Companny edit.

        

        #t.boolean "head_quarter", :visible => false, :default => true 
             
        

        # It will be necessary to create usernames and password for each user. It may be that these usrnames and passwords
        # could be assigned to each branch independely by the global admin user in the company. It has to be taking
        # into account that the Branch Admin user won't be able to do CRUD in anything to do with the Company
               

        t.boolean "pass_active", :default => false
        t.boolean "acc_active", :default => false                                                                                                                                                                                                           
        t.string "password_digest"

        t.datetime "last_in"

        t.boolean "is_virtual", :default => true
        #t.boolean "is_default", :default => false

        t.string "time_zone"

        t.timestamps null: false
    end 

        add_index("companies", "id_code")
        add_index("companies", "name")
        add_index("companies", "email")
        add_index("companies", "discipline")
  end



  def down

    drop_table :companies

  end

end

  