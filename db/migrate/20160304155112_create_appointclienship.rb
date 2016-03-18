class CreateAppointclienship < ActiveRecord::Migration
  

  def up
    create_table :appointclienship  do |t|
      
    	t.integer "appointment_id"
    	t.integer "client_id"
      t.string "creator"
    end
         add_index :appointclienship, ["appointment_id", "client_id"]
         add_index("appointclienship"  , "creator")
  end


  def down
    drop_table :appointclienship
  end
end
