# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

require 'json'
 
module BRPopulate
  def self.states
    ActiveSupport::JSON.decode(Rails.root.join("db", "states.json"))
  end
 
  def self.capital?(city, state)
    city["name"] == state["capital"]
  end
 
  def self.populate
    states.each do |state|
      state_obj = State.create(:acronym => state["acronym"], :name => state["name"])
 
      state["cities"].each do |city|
        City.create(:name => city, :state_id => state_obj.id, :capital => capital?(city, state))
      end
    end
  end
end
 
BRPopulate.populate