require 'rails_helper'

RSpec.describe "speakers/index", type: :view do
  before(:each) do
    assign(:speakers, [
      Speaker.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :website => "Website",
        :company => "Company"
      ),
      Speaker.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :website => "Website",
        :company => "Company"
      )
    ])
  end

  it "renders a list of speakers" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
  end
end
