class SourcePresenter < SimpleDelegator
  extend PresenterCollection

  def as_json
    {
      id: id,
      name: name,
      notes: notes
    }
  end

end
