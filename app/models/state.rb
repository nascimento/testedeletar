class State < ActiveRecord::Base
  attr_accessible :acronym, :name
  
  has_many :cities
end
