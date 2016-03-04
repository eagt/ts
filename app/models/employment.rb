class Employment < ActiveRecord::Base


	
	# 0ne-to-One
	# One-to- Many	
	has_many :updates_deletes
	# Many-to-Many Simple
 	# Many-to-Many Rich

 	belongs_to :company
 	belongs_to :profsessional
 	# Many-to-Many through
end
