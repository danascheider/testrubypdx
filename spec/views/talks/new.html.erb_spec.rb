require 'rails_helper'

RSpec.describe "talks/new", type: :view do
  before(:each) do
    assign(:talk, Talk.new(
      :title => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new talk form" do
    render

    assert_select "form[action=?][method=?]", talks_path, "post" do

      assert_select "input#talk_title[name=?]", "talk[title]"

      assert_select "input#talk_description[name=?]", "talk[description]"
    end
  end
end
