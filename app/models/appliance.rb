class Appliance < ActiveRecord::Base
  has_many :appliance_brands
  has_many :appliance_problems
  has_many :appliance_tools
  has_many :videos
end
