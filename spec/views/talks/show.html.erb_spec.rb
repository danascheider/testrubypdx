require 'rails_helper'

RSpec.describe "talks/show", type: :view do
  before(:each) do
    @talk = assign(:talk, FactoryGirl.create(:talk))
    @user = FactoryGirl.create(:user, id: 1)
    def view.current_user; @user; end
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to have_content @talk.title
    expect(rendered).to have_content @talk.description
  end

  it "includes the speaker's name" do 
    render
    expect(rendered).to have_content @talk.speaker.name
  end
end
