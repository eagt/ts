class Company < ActiveRecord::Base

	#validates :name, presence: true, length: { maximum: 20 }
	include SharedMethods

	# 0ne-to-One
	has_one :contact_details
	
	# One-to- Many	
	has_many :branches
	has_many :updates_deletes

 	# Many-to-Many Simple
 	has_and_belongs_to_many :clients

 	# Many-to-Many Rich
 	has_many :comp_appointments

 	# Many-to-Many through
 	has_many :employments
 	has_many :professionals, through => :employments
end

# before_save { email.downcase! }
# #before_save { self.email = email.downcase }	
# validates :first_name, presence: true, length: { maximum: 20 }
# # The first part could be written as  validates(:name, presence: true)
# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
# validates :email, presence: true, length: { maximum: 45 }, format: { with: VALID_EMAIL_REGEX }, 
# 														   uniqueness: { case_sensitive: false }						   
# validates :password, presence: true, length: { minimum: 6 }

# end
