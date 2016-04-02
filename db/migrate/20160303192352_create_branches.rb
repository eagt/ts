class CreateBranches < ActiveRecord::Migration
  
  def up

    create_table :branches do |t|

       # Token to identify a register, not unique as it links instance for different users
      t.string "id_token"       #, :null => false

      t.integer "company_id"        #, :visible => false  # I can change it if I want to see it

      t.string "discipline", :limit => 25
    
      t.string "name", :limit => 50     #, :null => false

      t.string "id_code", :limit => 25  # Make it automatic, take the three first words of 
       									 # the Branch's name and add four numbers sequentially
      t.string "email", :default => "@"     #, :null => false

       t.integer "contact_details_id"     #, :visible => false
 
     

      # Note: In the next two columns I will leave the visible value while developing and testing...
      t.string "creator", :visible => true  # This has to be FILL IN automatically and kept on the data base depending who is the logger when creating it
                  # It could be either Company or Professional. In the View  it has to be a dropdown with both ooptions.

      t.string "logged_as", :visible => true  # This has to be FILL IN automatically depending who is the logger in the current session
                    # It would be deleted as soon as the user log off. Sort of virtual attribute.
    
      t.boolean "pass_active", :default => false
      t.boolean "acc_active", :default => false

      t.string "password_digest"
 
# #  Note: It will be necessary to create usernames and password for each user. It may be that these usrnames and passwords
# # could be assigned to each branch independely by the global admin user in the company. It has to be taking
# # into account that the Branch Admin user won't be able to do CRUD in anything to do with the Company
     
       # t.string "password_digest"
      
       t.datetime "last_in"

       t.string "time_zone"

       t.timestamps null: false

     end
#       This is a multi column index ... add_index :branches, ["company_id", "professional_id", "name", "id_code", "email"]
        add_index("branches", "company_id")       
        add_index("branches", "name")      
        add_index("branches", "id_token")
        add_index("branches", "id_code")
        add_index("branches", "email")
        add_index("branches", "discipline")

  end


  def down
    drop_table :branches 
  end

end



