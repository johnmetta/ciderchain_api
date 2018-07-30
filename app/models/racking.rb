class Racking < ActiveRecord::Base

  belongs_to :state
  belongs_to :unit
  belongs_to :vessel
  belongs_to :batch
  belongs_to :closed_by, class_name: Racking.name, foreign_key: :closed_by_id
  has_many  :measurements
  has_many  :additions

  validates :state, presence: true
  validates :volume, presence: true
  validates :unit, presence: true
  validates :batch, presence: true
  validate  :check_packaged

  before_create :default_volume
  after_commit  :close_previous_racking

  scope :by_state, -> (state) { where(state_id: state.id) }
  scope :open, -> { where(closed: nil) }
  scope :by_vessel, -> (vessel) { where(vessel_id: vessel.id) }

  def base_volume
    volume * unit.factor
  end

  def close!(racking)
    raise ArgumentError unless racking.is_a?(Racking)
    self.closed = Date.today
    self.closed_by = racking
    self.save
  end

  def display_name
    "#{state.name} #{closed? ? '(closed)' : ''}"
  end

  private

  def default_volume
    volume = volume.presence || batch.volume
    unit = unit.presence || batch.unit
  end

  def check_unique_racking
    if batch.rackings.open.reject{|s| s.id == id}.any? && !closed
      errors.add(:closed, 'Cannot have more than one open racking per batch')
    end
  end

  def close_previous_racking
    return unless batch.present?
    unless self.closed
      batch.rackings.open.reject{|s| s.id == id}.map{|s| s.close! self }
    end
  end

  def check_packaged
    if state == State.find_by_name('packaged')
      self.closed = true
      self.packaged = true
    else
      errors.add(:vessel, 'must be present') unless self.vessel_id
    end
  end
end
