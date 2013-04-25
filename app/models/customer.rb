class Customer < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :hostname, :cnpj

  # Validations
  validates_presence_of :name, :hostname, :name
  validates_uniqueness_of :cnpj

  # Relations
  has_many :users
  has_many :groups
  
  # Brazilian Rails
  usar_como_cnpj :cnpj
end
