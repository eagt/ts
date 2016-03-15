class Company < ActiveRecord::Base

	#validates :name, presence: true, length: { maximum: 20 }
	include SharedMethods

	# 0ne-to-One
	has_one :contact_details
	
	# One-to- Many	
	has_many :branches
	has_many :updates_deletes
	has_many :clients
	has_many :appointments

 	# Many-to-Many Simple
 	has_many :clients

 	# Many-to-Many Rich
 	

 	# Many-to-Many through
 	has_many :employments
 	has_many :professionals, :through => :employments




 	# scopes
 	scope :sorted_name, lambda { order("companies.name ASC")}
  	scope :newest_first, lambda { order("companies.created_at DESC")}
  	scope :search, lambda {|query| where (["name LIKE?", "%#{query}%"])}


  	after_initialize :generate_token, :if => :new_record?

	private
		MAX_RETRIES = 3
		# generate a unique token id for new records
		def generate_token			
			self.id_token ||= SecureRandom.hex(8) 
			if Company.exists?(:id_token => self.id_token)
				self.id_token = nil
				raise
			end			
		rescue Exception => e
			@token_attempts = @token_attempts.to_i + 1
			puts "Record not unique " + @token_attempts.to_s
			retry if @token_attempts < MAX_RETRIES
			raise e, "#{I18n.t(:company)}: #{I18n.t(:create_unsuccess)} #{I18n.t(:uniqueness_unsuccess)}"
		end
end
