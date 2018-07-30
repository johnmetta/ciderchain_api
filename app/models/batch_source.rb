class BatchSource < ActiveRecord::Base
  belongs_to :batch
  belongs_to :source
end
