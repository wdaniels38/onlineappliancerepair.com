class Video < ActiveRecord::Base
  belongs_to :appliance
  belongs_to :appliance_problem
end
