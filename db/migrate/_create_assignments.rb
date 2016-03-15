class CreateAssignments < ActiveRecord::Migration

  def up

  create_table :assignments do |t|
       
       t.integer "professional_id"
       t.integer "appointment_id"

       t.timestamps null: false
     end

     add_index :assignments, ["professional_id", "appointment_id"]
     #add_index("prof_appointments", "date_time")
 
   end


   def down
 
     drop_table :assignments

   end 
  
end