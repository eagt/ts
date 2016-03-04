class Client < ActiveRecord::Base

# 0ne-to-One
has_one :contact_details

# One-to- Many
has_many :updates_deletes


# Many-to-Many Simple
has_and_belongs_to_many :appointments
has_and_belongs_to_many :companies
has_and_belongs_to_many :professionals
has_and_belongs_to_many :branches

# Many-to-Many Rich

# Many-to-Many through



end
