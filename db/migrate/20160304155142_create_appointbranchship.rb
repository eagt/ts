class CreateAppointbranchship < ActiveRecord::Migration
  
   def up
    create_table :appointbranchship do |t|
      
      t.integer "appointment_id"
    	 t.integer "branch_id"
       t.string "creator"
    end
         add_index :appointbranchship, ["appointment_id", "branch_id"]
         add_index("appointbranchship" , "creator")
  end


  def down
  drop_table :appointbranchship
  end
end