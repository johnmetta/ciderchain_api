require 'rails_helper'

RSpec.describe "rackings/index", type: :view do
  before(:each) do
    assign(:rackings, [
      Racking.create!(),
      Racking.create!()
    ])
  end

  it "renders a list of rackings" do
    render
  end
end
