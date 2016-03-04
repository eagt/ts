class CreateUpdatesDeletes < ActiveRecord::Migration
  def up
    create_table :update_deletes do |t|

    	t.integer "company_id"
    	t.integer "branch_id"
    	t.integer "professional_id"
    	t.integer "client_id"
    	t.integer "contact_details_id" 
    	t.integer "payment_details_id" 

        t.integer "employment_id"       
        t.integer "appointments_id"  
        t.integer "update_deletes_id" 
     

    # Below are the details that are going to be pull out 
    # from the database and be recorded on this tbale. The name and
    # last_name of the logged user executing this action which will be pull out from the user's login
    # There would be necessary to create a methods to fill in these details

      	t.string "name"
        t.string "last_name"
        t.string "table_name"  
      	t.string "column_name"
      	t.string "element"
      	t.string "action_taken"    	
        t.text   "reason"
        t.string "new_element"


        t.timestamps null: false
     end

    	add_index("update_deletes", "company_id")
     	add_index("update_deletes", "branch_id")
     	add_index("update_deletes", "professional_id")
     	add_index("update_deletes", "client_id")
     	add_index("update_deletes", "contact_details_id")
        add_index("update_deletes", "payment_details_id")
      	add_index("update_deletes", "employment_id")
      	add_index("update_deletes", "appointments_id")      
     	add_index("update_deletes", "update_deletes_id")


     	add_index("update_deletes", "table_name")
     	add_index("update_deletes", "last_name")
     	add_index("update_deletes", "action_taken")
     	add_index("update_deletes", "new_element")
    end

  	def down
    drop_table :update_deletes 
    end

end