class RackingPresenter < SimpleDelegator
  extend PresenterCollection

  def as_json
    {
      id: id,
      volume: volume,
      batch_id: batch_id,
      unit_id: unit_id,
      vessel_id: vessel_id,
      state_id: state_id,
      closed: closed,
      created_at: created_at,
      closed_by_id: closed_by_id,
      last_addition: additions.last ? AdditionPresenter.new(additions.last).as_json : {}
    }
  end

end
