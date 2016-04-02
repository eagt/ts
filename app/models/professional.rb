class Professional < ActiveRecord::Base

	#validates :name, presence: true, length: { maximum: 20 }
	#include SharedMethods
 	# has_secure_password
 	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
 	#validates :name, presence: true, length: { maximum: 20 }
 	
	# 0ne-to-One
	has_one :contact_details

	# One-to- Many	
	has_many :updates_deletes

	# Many-to-Many Simple


 	# Many-to-Many Rich
	

	# Many-to-Many through
	has_many :clienprofeships
	has_many :clients, :through => :clienprofeships

	has_many :branchprofeships
	has_many :branches, :through => :branchprofeships


	has_many :assignments
	has_many :appointments, :through => :assignments
	
	has_many :employments
 	has_many :companies, :through => :employments



 	validates_presence_of :first_name


 	scope :sorted_name, lambda { order("professionals.first_name ASC")}
	scope :sorted_Lastname, lambda { order("professionals.last_name ASC")}
  	scope :newest_first, lambda { order("professionals.created_at DESC")}
  	scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])}


 #    after_initialize :generate_token, :if => :new_record?

	# private
	# 	MAX_RETRIES = 3
	# 	# generate a unique token id for new records
	# 	def generate_token
	# 		self.id_token ||= SecureRandom.hex(8) 
	# 		if Professional.exists?(:id_token => id_token)
	# 			self.id_token = nil
	# 			raise
	# 		end			
	# 	rescue Exception => e
	# 		@token_attempts = @token_attempts.to_i + 1
	# 		puts "Record not unique " + @token_attempts.to_s
	# 		retry if @token_attempts < MAX_RETRIES
	# 		raise e, "#{I18n.t(:professional)}: #{I18n.t(:create_unsuccess)} #{I18n.t(:uniqueness_unsuccess)}"
	# 	end

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
