
module SharedMethods

    extend ActiveSupport::Concern
  # What is wanted with this method is to be able to run all what it has to do with 
  # email and password validations in one place. But it can be also used to run other share parts of model/s
  # Code taken from: http://stackoverflow.com/questions/3461704/ruby-on-rails-shared-method-between-models
  # In relation with the the has_secure_password, I haven't been able to place it here too.

 

 included do

  # THE VALIDATION HAS_SECURE_PASSWORD BELOW IS COMMENTED OUT WHILE THE USERS, COMPANIES & PROFESSIONALS 
  # ARE DEFINED HOW ARE THEY GOIN TO SIGN UP & LOG IN.
    #has_secure_password
    
      #before_save { self.email = email.downcase }  or 
    before_save { email.downcase! }
    # before_save { first_name.camelcase! }
    # before_save { company.camelcase! }
  
    validates :name, presence: true, length: { maximum: 20 }
    # The first part could be written as  validates(:name, presence: true)
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 45 }, format: { with: VALID_EMAIL_REGEX }, 
                                   uniqueness: { case_sensitive: false }                     


    # THE TWO VALIDATIONS BELOW ARE COMMENTED OUT WHILE THE USERS, COMPANIES & PROFESSIONALS 
    # ARE DEFINED HOW ARE THEY GOIN TO SIGN UP & LOG IN.
    # validates :password, presence: true, length: { minimum: 6 }, allow_nil: true # To avoid duplicate messages
    # validates :password_confirmation, presence: true, length: { minimum: 6 }
    end
end

