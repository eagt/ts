class CreateClienprofeships < ActiveRecord::Migration
  
  def up
    create_table :clienprofeships do |t|
    
    	t.integer "client_id"
    	t.integer "professional_id"
      t.string "creator"
    end
    add_index("clienprofeships", "client_id")
     add_index("clienprofeships", "professional_id")
    add_index("clienprofeships", "creator")

  end

   def down
       drop_table :clienprofeships
  end
  
end
