require 'rails_helper'

RSpec.describe "speakers/edit", type: :view do
  before(:each) do
    @speaker = assign(:speaker, Speaker.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :website => "MyString",
      :company => "MyString"
    ))
  end

  it "renders the edit speaker form" do
    render

    assert_select "form[action=?][method=?]", speaker_path(@speaker), "post" do

      assert_select "input#speaker_first_name[name=?]", "speaker[first_name]"

      assert_select "input#speaker_last_name[name=?]", "speaker[last_name]"

      assert_select "input#speaker_website[name=?]", "speaker[website]"

      assert_select "input#speaker_company[name=?]", "speaker[company]"

      assert_select "textarea#speaker_bio[name=?]", "speaker[bio]"
    end
  end
end
