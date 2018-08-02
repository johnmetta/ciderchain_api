require 'rails_helper'

RSpec.describe "rackings/show", type: :view do
  before(:each) do
    @racking = assign(:racking, Racking.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
