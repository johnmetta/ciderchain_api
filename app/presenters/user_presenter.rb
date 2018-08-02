class UserPresenter < SimpleDelegator
  extend PresenterCollection

  def as_json
    {
      id: id,
      email: email
    }
  end
end
