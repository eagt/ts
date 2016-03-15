class Employment < ActiveRecord::Base


	
	# 0ne-to-One
	# One-to- Many	
	has_many :updates_deletes
	# Many-to-Many Simple
 	# Many-to-Many Rich

 	belongs_to :company
 	belongs_to :professional
 	# Many-to-Many through

 	

 	scope :sorted_id, lambda { order("employments.id ASC")}
  	scope :newest_first, lambda { order("employment.created_at DESC")}
  	scope :search, lambda {|query| where (["name LIKE?", "%#{query}%"])}


  	validates_presence_of :professional_id, :company_id
end
