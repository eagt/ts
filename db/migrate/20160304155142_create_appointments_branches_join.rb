class CreateAppointmentsBranchesJoin < ActiveRecord::Migration
  
  def up
    create_table :appointments_branches do |t|
      	t.integer "appointment_id"
    	t.integer "branch_id"
    end
         add_index :appointments_branches, ["appointment_id", "branch_id"]
  end


  def down
    drop_table :appointments_branches
  end
end