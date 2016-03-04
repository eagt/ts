class ProfAppointment < ActiveRecord::Base


	
	# 0ne-to-One
	# One-to- Many	
	has_many :updates_deletes
	# Many-to-Many Simple
	
 	# Many-to-Many Rich
 	belongs_to :appointment
	belongs_to :professional

 	# Many-to-Many through

	
end
