class UnitPresenter < SimpleDelegator
  extend PresenterCollection

  def as_json
    {
      id: id,
      name: name,
      short_name: short_name
    }
  end
end
