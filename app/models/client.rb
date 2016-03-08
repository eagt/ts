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


# scopes
 	scope :sorted_lname, lambda { order("clients.last_name ASC")}
  	scope :newest_first, lambda { order("clients.created_at DESC")}
  	scope :search, lambda {|query| where (["name LIKE?", "%#{query}%"])}



end
