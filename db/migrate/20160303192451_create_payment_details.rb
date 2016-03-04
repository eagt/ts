class CreatePaymentDetails < ActiveRecord::Migration
  def change
    create_table :payment_details do |t|


       t.integer "appointment_id"

       # there must be a field where can be processed if the appointent has been paid in full 
       #or will be paid in the followup. Appointment can't be discharged if payment hasn't been done totaly.

   	   t.float "total_project_price"
       t.float "task_payment"
       t.float "professional_fee"
       t.float "remaining_project_payment"

       t.timestamps null: false
    end
    	 add_index("payment_details","appointment_id")
       add_index("payment_details","total_project_price")
  end
  

  def down
  	drop_table :payment_details
  end

end





