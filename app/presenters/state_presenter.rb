class StatePresenter < SimpleDelegator
  extend PresenterCollection

  def as_json
    {
      id: id,
      name: name,
      total_volume: total_volume.round,
      units: Unit.liter.short_name,
      gallons: (total_volume * (1/Unit.gallon.factor)).round(1),
      batches: BatchPresenter.collection(batches).as_json
    }
  end

end
