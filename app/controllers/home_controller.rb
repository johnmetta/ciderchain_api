class HomeController < ApplicationController
  def index
    @states = State.front_page
    json_response(@states)
  end
end
