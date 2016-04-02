class Branch < ActiveRecord::Base

	# 0ne-to-One
	has_one :contact_details
	
	# One-to- Many	
	belongs_to :company
	has_many :appointments
	has_many :updates_deletes
	has_many :clients

	# Many-to-Many Simple
	
	

 	# Many-to-Many Rich

 	# Many-to-Many through
 	has_many :branchprofeships
	has_many :professionals, :through => :branchprofeships


 	# scopes
 	scope :sorted_name, lambda { order("branches.name ASC")}
  	scope :newest_first, lambda { order("branches.created_at DESC")}
  	scope :search, lambda {|query| where (["name LIKE?", "%#{query}%"])}

  	# /**************  ------------------  ******************** /

  	# validates_presence_of :company_id  This was removed to be able to see the create new branch

  	# /**************  ------------------  ******************** /



  	

  	# after_initialize :generate_token, :if => :new_record?


  # 	private
		# MAX_RETRIES = 3
		# # generate a unique token id for new records
		# def generate_token
		# 	self.id_token ||= SecureRandom.hex(8)
		# 	if Branch.exists?(:id_token => id_token)
		# 		self.id_token = nil
		# 		raise
		# 	end			
		# rescue Exception => e
		# 	@token_attempts = @token_attempts.to_i + 1
		# 	puts "Record not unique " + @token_attempts.to_s 
		# 	retry if @token_attempts < MAX_RETRIES
		# 	raise e, "#{I18n.t(:branch)}: #{I18n.t(:create_unsuccess)} #{I18n.t(:uniqueness_unsuccess)}"
		# end
	
end
