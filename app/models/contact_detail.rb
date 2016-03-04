class ContactDetail < ActiveRecord::Base


	
	# 0ne-to-One
	belongs_to :company
	belongs_to :professional
	belongs_to :branch
	belongs_to :client

	# One-to- Many	
	has_many :updates_deletes

	
	# Many-to-Many Simple
 	# Many-to-Many Rich
 	# Many-to-Many through
end
