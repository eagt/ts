class CreateAppointmentsClientsJoin < ActiveRecord::Migration
  

  def up
    create_table :appointments_clients  do |t|
    	t.integer "appointment_id"
    	t.integer "client_id"
    end
         add_index :appointments_clients, ["appointment_id", "client_id"]
  end


  def down
    drop_table :appointments_clients
  end
end
