module RackingsHelper
  def get_batch_rackings_for_select(batch)
    batch.rackings.map{|s| [s.id, s.display_name]}
  end
end
