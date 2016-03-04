class CreateCompAppointments < ActiveRecord::Migration

# There might be data duplication errors but while testing it can be allowed
# Data duplication can be due to the appointments fields
  def up
    create_table :comp_appointments do |t|

       t.integer "company_id"
       t.integer "appointment_id"

       t.timestamps null: false
     end

     add_index :comp_appointments, ["company_id", "appointment_id"]
     #add_index("comp_appointments", "date_time")
 
   end

   def down
 
     drop_table :comp_appointments

   end 
  
end