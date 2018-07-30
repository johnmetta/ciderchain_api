class Batch < ActiveRecord::Base

  has_many  :rackings, dependent: :destroy
  has_many :sources
  belongs_to :unit

  validates :code, presence: true, uniqueness: true
  validates :volume, presence: true
  validates :unit, presence: true
  validate :unique_racking

  def self.new_code
    code_string(next_batch_number)
  end

  def self.code_string(batch_number)
    [Time.now.year, 'C', sprintf('%04d',batch_number)].join
  end

  def self.next_batch_number
    batch_number = this_year.count+1
    while Batch.where(code: code_string(batch_number)).any?
      batch_number += 1
    end
    batch_number
  end

  def self.this_year
    Batch.where('created_at > ? and created_at < ?', Time.now.beginning_of_year, Time.now.end_of_year)
  end

  def days_in
    days = (Date.today - created_at.to_date).to_i
    days > 0 ? days : 0
  end

  def current_racking
    rackings.last
  end

  def package!
    self.rackings.create(
                   volume: volume,
                   unit_id: unit.id,
                   state: State.find_by_name('packaged')
    )
    self.save!
  end

  private

  def unique_racking
    if rackings.open.many?
      errors.add(:racking, 'can only have one open racking')
    end
  end

end
