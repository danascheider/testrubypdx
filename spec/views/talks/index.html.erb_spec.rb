require 'rails_helper'

RSpec.describe "talks/index", type: :view do
  before(:each) do
    assign(:talks, [
      Talk.create!(
        :title => "Title",
        :description => "Description"
      ),
      Talk.create!(
        :title => "Title",
        :description => "Description"
      )
    ])
  end

  it "renders a list of talks" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
