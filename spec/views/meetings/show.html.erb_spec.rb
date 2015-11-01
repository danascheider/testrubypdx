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

  it "doesn't show a destroy link" do 
    render
    expect(rendered).not_to have_link 'Destroy'
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

    it "shows a destroy link" do 
      render
      expect(rendered).to have_link 'Destroy'
    end
  end
end
