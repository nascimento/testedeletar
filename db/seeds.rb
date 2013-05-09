# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

require 'json'

puts "# --- INITIALIZING DATABASE --- #"

puts "############### STATES AND CITIES"
 
  module BRPopulate
    def self.states
      ActiveSupport::JSON.decode(Rails.root.join("db", "states.json"))
    end
   
    def self.capital?(city, state)
      city["name"] == state["capital"]
    end
   
    def self.populate
      states.each do |state|
        state_obj = State.find_or_create_by_name(:acronym => state["acronym"], :name => state["name"])
   
        state["cities"].each do |city|
          City.find_or_create_by_name(:name => city, :state_id => state_obj.id, :capital => capital?(city, state))
        end
      end
    end
  end
  puts "--- Inserting Brazilians Cities and States ---"
  BRPopulate.populate

puts "############### PERMISSIONS"

  def get_model_names_sub
    	Dir['app/models/*.rb'].map {|f| File.basename(f, '.*').camelize.constantize.name }.reject!{|m| m.constantize.superclass != ActiveRecord::Base }
  end

  puts "--- Inserting Model Permissions ---"
  get_model_names_sub.each do |models_names|
  	%w{index create update new show edit destroy}.each do |action|
  		puts "Creating permission to access #{action} on #{models_names}"
  		Permission.find_or_create_by_action_and_subject_class(:action => action, :subject_class => models_names, :name => "Can #{action} #{models_names}")
  	end
  end

  puts "--- Inserting Custom Permissions ---"
  %w{Dashboard Help}.each do |models_names|
    %w{index}.each do |action|
    	puts "Creating permission to access #{action} on #{models_names}"
    	Permission.find_or_create_by_action_and_subject_class(:action => action, :subject_class => models_names, :name => "Can #{action} #{models_names}")
    end
  end

puts "############### CUSTOMER"

  Customer.find_or_create_by_name(:name => "Default", :hostname => "www")


puts "# --- Fim --- #"