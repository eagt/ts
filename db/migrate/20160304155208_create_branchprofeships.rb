class CreateBranchprofeships < ActiveRecord::Migration
  
  def up
    create_table :branchprofeships do |t|
      
      t.integer "branch_id"
    	t.integer "professional_id"
      t.string "creator"
    end
         add_index :branchprofeships, ["branch_id", "professional_id"]
        add_index("branchprofeships",  "creator")
  end


  def down
     drop_table :branchprofeships
  end
end