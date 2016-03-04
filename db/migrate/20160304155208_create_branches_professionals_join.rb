class CreateBranchesProfessionalsJoin < ActiveRecord::Migration
  
  def up
    create_table :branches_professionals do |t|
       	t.integer "branch_id"
    	t.integer "professional_id"
    end
         add_index :branches_professionals, ["branch_id", "professional_id"]
  end


  def down
    drop_table :branches_professionals
  end
end