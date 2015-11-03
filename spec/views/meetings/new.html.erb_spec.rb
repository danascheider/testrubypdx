require 'rails_helper'

RSpec.describe "meetings/new", type: :view do
  before(:each) do
    assign(:meeting, Meeting.new())
  end

  it "renders new meeting form" do
    render

    assert_select "form[action=?][method=?]", meetings_path, "post" do
      assert_select 'input#meeting_date'
      assert_select 'input#meeting_time'
      assert_select 'textarea#meeting_description'
    end
  end
end
