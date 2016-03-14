class CreateEmployments < ActiveRecord::Migration
  
  def up

    create_table :employments do |t|

      t.integer "company_id"
      t.integer "professional_id"

      t.boolean "validated", :default => false  # This attribute will change to true once the professional confirms the relation
                                                # clicking on the link found on the email to confirm Employment relationship

      t.datetime "absent_on"

      t.datetime "Holidays_from"
      t.datetime "Holidays_to"
      t.integer "total_days_holidays"
      t.integer "total_days_off"
      t.integer "creator"
      t.integer "logged_as"
      t.timestamps null: false

    end

    add_index :employments, ["company_id", "professional_id"]
  	add_index("employments", "total_days_holidays")
  	add_index("employments", "total_days_off")

  end


  def down
  	drop_table :employments
  end
    
end
