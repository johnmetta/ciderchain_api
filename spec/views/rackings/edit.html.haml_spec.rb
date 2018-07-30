require 'rails_helper'

RSpec.describe "rackings/edit", type: :view do
  before(:each) do
    @racking = assign(:racking, Racking.create!())
  end

  it "renders the edit racking form" do
    render

    assert_select "form[action=?][method=?]", racking_path(@racking), "post" do
    end
  end
end
