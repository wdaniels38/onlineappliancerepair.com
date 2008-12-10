class ApplianceProblem < ActiveRecord::Base
  belongs_to :appliance
  has_many :videos
  validates_uniqueness_of :problem, :scope => :appliance_id
end
