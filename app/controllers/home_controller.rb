class HomeController < ApplicationController
  def index
    @states = State.front_page
  end
end
