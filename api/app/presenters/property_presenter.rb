class PropertyPresenter < SimpleDelegator
  extend PresenterCollection

  def as_json
    {
      id: id,
      name: name
    }
  end

end
