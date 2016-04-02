class Client < ActiveRecord::Base

# 0ne-to-One
has_one :contact_details

# One-to- Many
has_many :updates_deletes
belongs_to :company
belongs_to :branch


# Many-to-Many Simple



# Many-to-Many Rich

# Many-to-Many through

	has_many :appointclienships
	has_many :appointments, :through => :appointclienships

	has_many :clienprofeships
	has_many :professionals, :through => :clienprofeships


# scopes
 	scope :sorted_lname, lambda { order("clients.last_name ASC")}
  	scope :newest_first, lambda { order("clients.created_at DESC")}
  	scope :search, lambda {|query| where (["name LIKE?", "%#{query}%"])}


#validates_presence_of :company_id, :branch_id  REMOVED BECAUSE IT WASN'T ALLOWING TO SAVE A NEW CLIENT.


# after_initialize :generate_token, :if => :new_record?

# 	private
# 		MAX_RETRIES = 3
# 		# generate a unique token id for new records
# 		def generate_token
# 			self.id_token ||= SecureRandom.hex(8) 
# 			if Client.exists?(:id_token => id_token)
# 				self.id_token = nil
# 				raise
# 			end			
# 		rescue Exception => e
# 			@token_attempts = @token_attempts.to_i + 1
# 			puts "Record not unique " + @token_attempts.to_s
# 			retry if @token_attempts < MAX_RETRIES
# 			raise e, "#{I18n.t(:client)}: #{I18n.t(:create_unsuccess)} #{I18n.t(:uniqueness_unsuccess)}"
# 		end

end
