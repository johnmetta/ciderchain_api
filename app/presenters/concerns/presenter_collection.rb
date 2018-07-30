module PresenterCollection
  def collection(objects, *other)
    objects.map { |object| new(object, *other) }
  end
end
