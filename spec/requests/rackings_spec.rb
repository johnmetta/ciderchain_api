require 'rails_helper'

RSpec.describe "Rackings", type: :request do
  describe "GET /rackings" do
    it "works! (now write some real specs)" do
      get rackings_path
      expect(response).to have_http_racking(200)
    end
  end
end
