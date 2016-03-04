class CompAppointment < ActiveRecord::Base

	
	# 0ne-to-One
	# One-to- Many
	has_many :updates_deletes	
	# Many-to-Many Simple
 	# Many-to-Many Rich
 	# Many-to-Many through

	belongs_to :appointment
	belongs_to :company

end
