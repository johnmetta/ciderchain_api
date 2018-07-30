class State < ActiveRecord::Base

  has_many :rackings

  def self.front_page
    State.all.first(6)
  end

  def total_volume
    rackings.open.map(&:base_volume).sum
  end

  def batches
    rackings.open.map(&:batch)
  end

end
