class UpdatesDelete < ActiveRecord::Base

	# 0ne-to-One

	# One-to- Many
	belongs_to :company
	belongs_to :professional
	belongs_to :branch
	belongs_to :appointmnet
	belongs_to :client
	belongs_to :contact_detail
	belongs_to :payment_detail
	belongs_to :employment
	belongs_to :appointmnet	
	
	# Many-to-Many Simple

 	# Many-to-Many Rich

 	# Many-to-Many through
end
