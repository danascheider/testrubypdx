require 'rails_helper'

RSpec.describe "meetings/show", type: :view do
  let(:user) { FactoryGirl.create(:user, id: 1) }
  let(:meeting) { FactoryGirl.create(:meeting) }

  before(:each) do
    def view.current_user; nil; end
    @meeting = assign(:meeting, meeting)
  end

  it "renders the div" do
    render
    expect(rendered).to have_css 'div.show-meeting'
  end

  it "doesn't show an edit link" do 
    render
    expect(rendered).not_to have_link 'Edit'
  end

  context "meeting with talks" do 
    let(:talks) { FactoryGirl.create_list(:talks, 2, meeting_id: meeting.id) }

    it "displays the talks" do
      render
      expect(rendered).to have_css ".talk", count: 2
    end
  end

  context "logged-in user" do 
    before(:each) do 
      @user = user
      def view.current_user; @user; end
    end

    it "renders the div" do 
      render
      expect(rendered).to have_css 'div.show-meeting'
    end

    it "shows an edit link" do 
      render
      expect(rendered).to have_link 'Edit' 
    end
  end
end
