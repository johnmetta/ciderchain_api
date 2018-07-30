class BatchPresenter < SimpleDelegator
  extend PresenterCollection

  def as_json
    {
      id: id,
      name: name.try(:humanize),
      code: code,
      created_at: created_at,
      days_in: days_in,
      volume: volume,
      unit: UnitPresenter.new(unit).as_json,
      base_volume: unit == Unit.liter ? volume : (volume*unit.factor).round,
      current_racking: current_racking ? RackingPresenter.new(current_racking).as_json : nil,
      current_vessel: (current_racking && !current_racking.packaged) ? VesselPresenter.new(current_racking.vessel).as_json : nil
    }
  end
end
