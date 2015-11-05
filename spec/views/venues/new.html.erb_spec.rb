require 'rails_helper'

RSpec.describe "venues/new", type: :view do
  before(:each) do
    assign(:venue, Venue.new(
      :name => "MyString",
      :address_1 => "MyString",
      :address_2 => "",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString"
    ))
  end

  it "renders new venue form" do
    render

    assert_select "form[action=?][method=?]", venues_path, "post" do

      assert_select "input#venue_name[name=?]", "venue[name]"

      assert_select "input#venue_address_1[name=?]", "venue[address_1]"

      assert_select "input#venue_address_2[name=?]", "venue[address_2]"

      assert_select "input#venue_city[name=?]", "venue[city]"

      assert_select "input#venue_state[name=?]", "venue[state]"

      assert_select "input#venue_zip[name=?]", "venue[zip]"
    end
  end
end
