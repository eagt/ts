class Appointment < ActiveRecord::Base


	#belongs_to :company
	belongs_to :branch
	#belongs_to :professional
	belongs_to :client  GO to the right association

	has_many :update_deletes	


	

end