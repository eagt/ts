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


 	# scopes
 	scope :sorted_id, lambda { order("contact_details.id ASC")}
  	scope :newest_first, lambda { order("contact_details.created_at DESC")}
  	scope :search, lambda {|query| where (["name LIKE?", "%#{query}%"])}
end
