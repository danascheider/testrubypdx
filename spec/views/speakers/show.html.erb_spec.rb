require 'rails_helper'

RSpec.describe "speakers/show", type: :view do
  before(:each) do
    @speaker = assign(:speaker, Speaker.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :website => "Website",
      :company => "Company"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Company/)
  end
end
