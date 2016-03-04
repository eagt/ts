class CreateClientsProfesionalsJoin < ActiveRecord::Migration
  
  def up
    create_table :clients_profesionals, :id => false do |t|
    
    	t.integer "client_id"
    	t.integer "professional_id"
    end
    add_index :clients_profesionals, ["client_id", "professional_id"]
  end

  def down
    drop_table :clients_profesionals
  end
  
end
