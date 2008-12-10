class ApplianceTool < ActiveRecord::Base
  belongs_to :appliance
  validates_uniqueness_of :tools, :scope => :appliance_id  
end
