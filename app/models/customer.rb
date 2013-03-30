class Customer < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :hostname, :name

  # Relations
  has_many :users
  has_many :groups
end
