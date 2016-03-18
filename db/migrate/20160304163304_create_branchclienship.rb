class CreateBranchclienship < ActiveRecord::Migration
  
  def up
    create_table :branchclienship  do |t|
      
    t.integer "branch_id"
    t.integer "client_id"
    t.string "creator"
    end
         add_index :branchclienship, ["branch_id", "client_id"]
         add_index("branchclienship" , "creator")
  end


  def down
     drop_table :branchclienship
  end
end