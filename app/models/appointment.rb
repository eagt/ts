class Appointment < ActiveRecord::Base

	# 0ne-to-One


	# One-to- Many
	has_many :payment_details
	has_many :update_deletes

	# Many-to-Many Simple
	has_and_belongs_to_many :clients
	has_and_belongs_to_many :branches

	
	# Many-to-Many Rich
	has_many :comp_appointments
	has_many :prof_appointments
		
	# Many-to-Many through

end


	# 0ne-to-One
	# One-to- Many	
	# Many-to-Many Simple
 	# Many-to-Many Rich
 	# Many-to-Many through