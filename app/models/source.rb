class Source < ActiveRecord::Base
  has_many :batch_sources
  has_many :batches, through: :batch_sources
  has_many :additive_sources
  has_many :additives, through: :additive_sources
end
