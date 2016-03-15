class Appointment < ActiveRecord::Base

	# 0ne-to-One


	# One-to- Many
	belongs_to :company
	belongs_to :branch
	has_many :payment_details
	has_many :update_deletes

	# Many-to-Many Simple
	has_and_belongs_to_many :clients
		
	# Many-to-Many Rich

		
	# Many-to-Many through
	has_many :assigments
	has_many :professionals, :through => :assignments


	accepts_nested_attributes_for :assignments, reject_if: :all_blank


	after_initialize :generate_token, :if => :new_record?


	scope :sorted_discipline, lambda { order("appointments.discipline ASC")}
  	scope :newest_first, lambda { order("appointments.created_at DESC")}
  	scope :search, lambda {|query| where (["name LIKE?", "%#{query}%"])}



  	private
		MAX_RETRIES = 3
		# generate a unique token id for new records
		def generate_token
			self.id_token ||= SecureRandom.hex(8) 
			if Appointment.exists?(:id_token => id_token)
				self.id_token = nil
				raise
			end			
		rescue Exception => e
			@token_attempts = @token_attempts.to_i + 1
			puts "Record not unique " + @token_attempts.to_s
			retry if @token_attempts < MAX_RETRIES
			raise e, "#{I18n.t(:professional)}: #{I18n.t(:create_unsuccess)} #{I18n.t(:uniqueness_unsuccess)}"
		end

end


	# 0ne-to-One
	# One-to- Many	
	# Many-to-Many Simple
 	# Many-to-Many Rich
 	# Many-to-Many through