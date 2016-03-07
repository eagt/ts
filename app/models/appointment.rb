class Appointment < ActiveRecord::Base

	# 0ne-to-One


	# One-to- Many
	belongs_to :company
	belongs_to :branch
	has_many :payment_details
	has_many :update_deletes

	# Many-to-Many Simple
	has_and_belongs_to_many :clients
		
	# Many-to-Many Rich
	has_many :prof_appointments
		
	# Many-to-Many through


	scope :sorted_discipline, lambda { order("appointments.discipline ASC")}
  	scope :newest_first, lambda { order("appointments.created_at DESC")}
  	scope :search, lambda {|query| where (["name LIKE?", "%#{query}%"])}

end


	# 0ne-to-One
	# One-to- Many	
	# Many-to-Many Simple
 	# Many-to-Many Rich
 	# Many-to-Many through