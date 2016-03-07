class Branch < ActiveRecord::Base

	# 0ne-to-One
	has_one :contact_details
	
	# One-to- Many	
	belongs_to :company
	has_many :appointments
	has_many :updates_deletes

	# Many-to-Many Simple
	has_and_belongs_to_many :professionals
	has_and_belongs_to_many :clients

 	# Many-to-Many Rich

 	# Many-to-Many through

	
end
