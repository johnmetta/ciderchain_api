class MeasurementPresenter < SimpleDelegator
  extend PresenterCollection

  def as_json
    {
      id: id,
      value: value,
      racking_id: racking_id,
      created_at: created_at,
      property_id: property_id,
      property: PropertyPresenter.new(property).as_json,
      units: UnitPresenter.new(unit).as_json
    }
  end

end
