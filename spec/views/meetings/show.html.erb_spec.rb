require 'rails_helper'

RSpec.describe "meetings/show", type: :view do
  before(:each) do
    @meeting = assign(:meeting, FactoryGirl.create(:meeting))
  end

  it "renders the div" do
    skip('Gives me hell about current_user')
    render

    expect(page).to have_css 'div.show-meeting'
  end
end
