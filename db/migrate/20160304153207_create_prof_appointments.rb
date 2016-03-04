class CreateProfAppointments < ActiveRecord::Migration

  def up

  create_table :prof_appointments do |t|
       
       t.integer "professional_id"
       t.integer "appointment_id"

       t.timestamps null: false
     end

     add_index :prof_appointments, ["professional_id", "appointment_id"]
     #add_index("prof_appointments", "date_time")
 
   end


   def down
 
     drop_table :prof_appointments

   end 
  
end