class CreateUsers < ActiveRecord::Migration
  
  def up
    create_table :users do |t|
    	  t.column "first_name", :string, :limit => 20
        t.string "last_name", :limit =>20
        t.string "email", :default => " ", :null  =>false

      t.timestamps null: false
    end

  end

    def down

    drop_table :users
    
    end
end
