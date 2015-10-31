require 'rails_helper'

RSpec.describe "speakers/new", type: :view do
  before(:each) do
    assign(:speaker, Speaker.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :website => "MyString",
      :company => "MyString"
    ))
  end

  it "renders new speaker form" do
    render

    assert_select "form[action=?][method=?]", speakers_path, "post" do

      assert_select "input#speaker_first_name[name=?]", "speaker[first_name]"

      assert_select "input#speaker_last_name[name=?]", "speaker[last_name]"

      assert_select "input#speaker_website[name=?]", "speaker[website]"

      assert_select "input#speaker_company[name=?]", "speaker[company]"

      assert_select "textarea#speaker_bio[name=?]", "speaker[bio]"
    end
  end
end
