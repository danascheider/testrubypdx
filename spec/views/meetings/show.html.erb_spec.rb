require 'rails_helper'

RSpec.describe "meetings/show", type: :view do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    @meeting = assign(:meeting, FactoryGirl.create(:meeting))
  end

  it "renders the div" do
    skip('Need to find out what current_user is being called on when it appears in the erb templates')
    render

    expect(page).to have_css 'div.show-meeting'
  end
end
