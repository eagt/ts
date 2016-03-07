class Professional < ActiveRecord::Base

	#validates :name, presence: true, length: { maximum: 20 }
	include SharedMethods
 	# has_secure_password
 	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
 	#validates :name, presence: true, length: { maximum: 20 }
 	
	# 0ne-to-One
	has_one :contact_details

	# One-to- Many	
	has_many :updates_deletes

	# Many-to-Many Simple
	has_and_belongs_to_many :branches
	has_and_belongs_to_many :clients

 	# Many-to-Many Rich
	has_many :prof_appointments

	# Many-to-Many through
	has_many :employments
 	has_many :companies, :through => :employments


 	scope :sorted_name, lambda { order("professionals.name ASC")}
	scope :sorted_lastname, lambda { order("professionals.last_name ASC")}
  	scope :newest_first, lambda { order("professionals.created_at DESC")}
  	scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])}
end

# before_save { email.downcase! }
# #before_save { self.email = email.downcase }	
# validates :name, presence: true, length: { maximum: 20 }
# # The first part could be written as  validates(:name, presence: true)
# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
# validates :email, presence: true, length: { maximum: 45 }, format: { with: VALID_EMAIL_REGEX }, 
# 														   uniqueness: { case_sensitive: false }						   
# validates :password, presence: true, length: { minimum: 6 }

# end
