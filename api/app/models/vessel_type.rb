class VesselType < ActiveRecord::Base

  has_many :vessels

  validates :name, presence: true

  def self.flex_tank
    VesselType.find_by_name 'FlexTank'
  end
  def self.brite_tank
    VesselType.find_by_name 'Brite Tank'
  end
  def self.barrel
    VesselType.find_by_name 'Barrel'
  end

  def short_name
    abbreviation || name
  end

end
