class ApplianceBrand < ActiveRecord::Base
  belongs_to :appliance
  validates_uniqueness_of :brand, :scope => :appliance_id
end
