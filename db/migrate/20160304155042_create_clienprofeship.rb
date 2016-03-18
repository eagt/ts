class CreateClienprofeship < ActiveRecord::Migration
  
  def up
    create_table :clienprofeship do |t|
    
    	t.integer "client_id"
    	t.integer "professional_id"
      t.string "creator"
    end
    add_index :clienprofeship, ["client_id", "professional_id"]
    add_index("clienprofeship", "creator")

  end

   def down
       drop_table :clienprofeship
  end
  
end
