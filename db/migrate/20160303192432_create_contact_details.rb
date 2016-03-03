class CreateContactDetails < ActiveRecord::Migration
 

	  def up

	    create_table :contact_details do |t|

	      t.integer "company_id"
	      t.integer "branch_id"
	      t.integer "professional_id"
	      t.integer "client_id"
	      t.integer "user_id"

	      
	      t.string "address_type"
	      t.string "address"
	      t.string "city"
	      t.string "state"
	      t.string "country"

	      t.string "tel"

	      t.boolean "validated", :default => false

	      t.timestamps null: false

	    end
	    add_index :contact_details, ["company_id", "branch_id", "branch_id", "professional_id", "client_id", "user_id")
	  end


	  def down
	     drop_table :contact_details  
	  end 

end
