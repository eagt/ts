class Company < ActiveRecord::Base

	#validates :name, presence: true, length: { maximum: 20 }
	include SharedMethods

	# 0ne-to-One
	has_one :contact_details
	
	# One-to- Many	
	has_many :branches
	has_many :updates_deletes
	has_many :appointments

 	# Many-to-Many Simple
 	has_and_belongs_to_many :clients

 	# Many-to-Many Rich
 	

 	# Many-to-Many through
 	has_many :employments
 	has_many :professionals, :through => :employments




 	# scopes
 	scope :sorted_name, lambda { order("companies.name ASC")}
  	scope :newest_first, lambda { order("companies.created_at DESC")}
  	scope :search, lambda {|query| where (["name LIKE?", "%#{query}%"])}

end
