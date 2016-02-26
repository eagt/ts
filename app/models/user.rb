class User < ActiveRecord::Base

validates :first_name, presence: true, length: { maximum: 20 }

include SharedMethods

end

# /* ----  All this was passed to the shared_method model  ---- */ 
# has_secure_password
# before_save { email.downcase! }
# #before_save { self.email = email.downcase }	
# validates :first_name, presence: true, length: { maximum: 20 }
# # The first part could be written as  validates(:name, presence: true)
# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
# validates :email, presence: true, length: { maximum: 45 }, format: { with: VALID_EMAIL_REGEX }, 
# 														   uniqueness: { case_sensitive: false }						   
# validates :password, presence: true, length: { minimum: 6 }

# end

