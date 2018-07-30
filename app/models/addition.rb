class Addition < ActiveRecord::Base

  belongs_to  :racking
  belongs_to  :unit
  belongs_to  :additive
  belongs_to  :source

  validates :amount, presence: true
  validates :racking, presence: true
  validates :unit, presence: true
  validates :additive, presence: true
end
