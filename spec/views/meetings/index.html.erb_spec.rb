require 'rails_helper'

RSpec.describe "meetings/index", type: :view do
  before(:each) do
    assign(:meetings, FactoryGirl.create_list(:meeting, 2))
  end

  it "renders a list of meetings" do
    render
  end
end
