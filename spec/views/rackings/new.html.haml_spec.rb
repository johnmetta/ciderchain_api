require 'rails_helper'

RSpec.describe "rackings/new", type: :view do
  before(:each) do
    assign(:racking, Racking.new())
  end

  it "renders new racking form" do
    render

    assert_select "form[action=?][method=?]", rackings_path, "post" do
    end
  end
end
