require 'rails_helper'

RSpec.describe "site/admin", type: :view do 
  before(:each) do 
    @admin = assign(:admin, FactoryGirl.create(:user, id: 1))
  end

  it "displays the admin actions" do 
    render
    expect(rendered).to have_link 'Add Meetings'
    expect(rendered).to have_link 'Add Talks'
    expect(rendered).to have_link 'Add Speakers'
  end
end