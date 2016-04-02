class CreateAppointclienships < ActiveRecord::Migration
  

  def up
    create_table :appointclienships  do |t|
      
    	t.integer "appointment_id"
    	t.integer "client_id"
      t.string "creator"
    end
         add_index :appointclienships, ["appointment_id", "client_id"]
         add_index("appointclienships"  , "creator")
  end


  def down
    drop_table :appointclienships
  end
end
