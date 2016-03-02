class Professional < ActiveRecord::Base

	#validates :name, presence: true, length: { maximum: 20 }
	include SharedMethods
 	# has_secure_password
 	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
 	#validates :name, presence: true, length: { maximum: 20 }
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
