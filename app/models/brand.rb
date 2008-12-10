class Brand < ActiveRecord::Base
  validates_uniqueness_of :brand
end
