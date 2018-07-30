class AdditionPresenter < SimpleDelegator
  extend PresenterCollection

  def as_json
    {
      id: id,
      amount: amount,
      racking_id: racking_id,
      unit_id: unit_id,
      additive_id: additive_id,
      name: additive.name,
      source_id: source_id,
      source_name: source.name,
      notes: notes
    }
  end

end
