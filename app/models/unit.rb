class Unit < ActiveRecord::Base

  belongs_to  :base, class_name: 'Unit'

  validates :name, presence: true, uniqueness: true
  validates :factor, presence: true

  def self.method_missing(method, *args)
    if Unit.all.map(&:name).include? method.to_s.downcase
      Unit.find_by_name(method)
    else
      super # <- make sure we pass through to Object#method_missing
    end
  end
end

