class Measurement < ActiveRecord::Base

  belongs_to  :racking
  belongs_to  :property
  belongs_to  :unit

  validates :value, presence: true

end
