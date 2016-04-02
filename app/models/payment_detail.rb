class PaymentDetail < ActiveRecord::Base

	
	# 0ne-to-One
	# One-to- Many	
	has_many :updates_deletes
	belongs_to :appointmnet

	# Many-to-Many Simple

 	# Many-to-Many Rich
 	
 	# Many-to-Many through

	


	scope :sorted_id, lambda { order("payment_details.id ASC")}
  	scope :newest_first, lambda { order("payment_details.created_at DESC")}
  	scope :search, lambda {|query| where (["name LIKE?", "%#{query}%"])}
end
