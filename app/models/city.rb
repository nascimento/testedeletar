class City < ActiveRecord::Base
  attr_accessible :capital, :name, :state_id
  
  belongs_to :state
end
