class CreateAssignments < ActiveRecord::Migration
  def up
    create_table :assignments do |t|

      t.integer :professional_id 
      t.integer :appointment_id    
      t.string :creator
      t.timestamps null: false
    end

      add_index("assignments", "professional_id")
      add_index("assignments", "appointment_id")
      add_index("assignments", "creator")
  end


  def down
       drop_table :assignments    
  end
  
end
