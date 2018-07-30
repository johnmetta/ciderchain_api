class Property < ActiveRecord::Base
  has_many  :measurements
  has_many  :rackings
end
