class CreateClients < ActiveRecord::Migration

	def up

	    create_table :clients do |t|

	       # In the next two columns I will leave the visible value while developing and testing...
	       t.string "creator", :visible => true  # This has to be FILL IN automatically and kept on the data base depending who is the logger when creating it
	      					  # It could be either Company or Professional. In the View  it has to be a dropdown with both ooptions.

	       t.string "logged_as", :visible => true  # This has to be FILL IN automatically depending who is the logger in the current session
	      					  	 # It would be deleted as soon as the user log off. Sort of virtual attribute.

	      t.string "id_code", :limit => 25
	      t.string "name", :limit => 50, :null => false
	      t.string "last_name", :limit => 50, :null => false
	      t.date "dob" #, :null => false
	      t.string "email", :default => "@"

	      t.string "photo"

	      t.timestamps null: false

	   	end
	      #add_index :clients, ["company_id", "professional_id", "branch_id", "dob", "email", "last_name"] 
	        add_index("clients", "dob")
	        add_index("clients", "email")
	        add_index("clients", "last_name")
	end

	def down

		drop_table :clients 
		
	end
 








end






