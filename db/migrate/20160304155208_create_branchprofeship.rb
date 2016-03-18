class CreateBranchprofeship < ActiveRecord::Migration
  
  def up
    create_table :branchprofeship do |t|
      
      t.integer "branch_id"
    	t.integer "professional_id"
      t.string "creator"
    end
         add_index :branchprofeship, ["branch_id", "professional_id"]
        add_index("branchprofeship",  "creator")
  end


  def down
     drop_table :branchprofeship
  end
end