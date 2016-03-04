class CreateBranchesClientsJoin < ActiveRecord::Migration
  
  def up
    create_table :branches_clients do |t|
    t.integer "branch_id"
    t.integer "client_id"
    end
         add_index :branches_clients, ["branch_id", "client_id"]
  end


  def down
    drop_table :branches_clients
  end
end