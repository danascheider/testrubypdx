require 'rails_helper'

RSpec.describe "venues/edit", type: :view do
  before(:each) do
    @venue = assign(:venue, FactoryGirl.create(:venue))
  end

  it "renders the edit venue form" do
    render

    assert_select "form[action=?][method=?]", venue_path(@venue), "post" do

      assert_select "input#venue_name[name=?]", "venue[name]"

      assert_select "input#venue_address_1[name=?]", "venue[address_1]"

      assert_select "input#venue_address_2[name=?]", "venue[address_2]"

      assert_select "input#venue_city[name=?]", "venue[city]"

      assert_select "input#venue_state[name=?]", "venue[state]"

      assert_select "input#venue_zip[name=?]", "venue[zip]"
    end
  end
end
