class CreateAppointments < ActiveRecord::Migration
  
def up

  # create_table :appointments do |t|

  #      t.integer "company_id"
  #      t.integer "branch_id"
  #      t.integer "professional_id"
  #      t.integer "client_id"
  #      t.integer "appointment_code"
  #      t.integer "follow_up_code"  # When appointment is created this field initialize in Zero (0). 
  #                                # In case the field needs_follwup is checked this field will add 1 to the appointment_code
  #                                # This will be done to see appointments related to a same subject/issue/problem

  #      t.string "service", :limit => 25

  #      # In the next two columns I will leave the visible value while developing and testing...
  #      t.string "creator", :visible => true  # This has to be FILL IN automatically and kept on the data base depending who is the logger when creating it
  #     					  # It could be either Company or Professional. In the View  it has to be a dropdown with both ooptions.

  #      t.string "logged_as", :visible => true  # This has to be FILL IN automatically depending who is the logger in the current session
  #     					  	 # It would be deleted as soon as the user log off. Sort of virtual attribute.

  #      t.datetime "date_time", :null => false
  #      t.string "status"

  #      t.string "task_type", :limit => 50
  #      t.text "task_note"
  #      t.string "photo"       
  #      t.boolean "needs_followup", :default => false

  #      t.timestamps null: false

  #    end
  #    add_index :appointments, ["company_id", "branch_id", "professional_id", "client_id", "appointment_code", "follow_up_code", "date_time", "status"]

        # add_index("appointments", "company_id")
        # add_index("appointments", "branch_id")
        # add_index("appointments", "professional_id")
        # add_index("appointments", "client_id")
        # add_index("appointments", "appointment_code")
        # add_index("appointments", "follow_up_code")
        # add_index("appointments", "date_time")
        # add_index("appointments", "status")

 end


   def down 
     drop_table :appointments
   end 

end

# Appointment Status:
# Arrived --> When the patient arrives to the appointment --> Marked by dmin staff
# Checked In --> When the patient is in the consulting room--> Marked by doctor
# Checked Out --> When the patient leaves the appointment --> Marked by doctor
# Booked --> When the appointment is booked. No matter if it is a new or a F/up appointment --> Marked by dmin staff
# Canceled --> When the appointment is canceled and not rescheduled--> Marked by dmin staff
# Rescheduled --> When the appointment has been rescheduled--> Marked by dmin staff
# Discharged --> When the the treatment is completed and payment has been received in full--> Marked by dmin staff

# Admin staff and doctor can be the same if the Ts is manage by a Professional

