class CreateClientsCompaniesJoin < ActiveRecord::Migration
  
  def up
    create_table :clients_companies do |t|
    
    	t.integer "client_id"
    	t.integer "company_id"
    end
    add_index :clients_companies, ["client_id", "company_id"]
  end

  def down
    drop_table :clients_companies
  end
  
end
