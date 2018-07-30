require "rails_helper"

RSpec.describe RackingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rackings").to route_to("rackings#index")
    end

    it "routes to #new" do
      expect(:get => "/rackings/new").to route_to("rackings#new")
    end

    it "routes to #show" do
      expect(:get => "/rackings/1").to route_to("rackings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rackings/1/edit").to route_to("rackings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rackings").to route_to("rackings#create")
    end

    it "routes to #update" do
      expect(:put => "/rackings/1").to route_to("rackings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rackings/1").to route_to("rackings#destroy", :id => "1")
    end

  end
end
