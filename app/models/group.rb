class Group < ActiveRecord::Base
  # Awesome nested set (Tree)
  acts_as_nested_set
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :customer_id, :parent_id, :user_ids, :permission_ids
  
  # Relations  
  belongs_to :customers
  has_and_belongs_to_many :users
  has_and_belongs_to_many :permissions
  belongs_to :parent, :class_name => "Group"
  
  # Permissions  
  validates_presence_of :name, :permissions
end
