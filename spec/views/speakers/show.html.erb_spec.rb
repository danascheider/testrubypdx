require 'rails_helper'

RSpec.describe "speakers/show", type: :view do
  let(:user) { FactoryGirl.create(:user, id: 1) }

  before(:each) do
    @speaker = assign(:speaker, FactoryGirl.create(:speaker, 
      :first_name => "Bob",
      :last_name => "Jones",
      :website => "http://www.bobjones.edu",
      :company => "Faith Hill Baptist University"
    ))

    @speaker.talks = FactoryGirl.create_list(:talk, 2)
  end

  context "when no user is logged in" do 
    before(:each) do
      def view.current_user; nil; end
    end

    it "renders attributes" do
      render
      expect(rendered).to match(/Bob Jones/)
      expect(rendered).to match(/http\:\/\/www\.bobjones\.edu/)
      expect(rendered).to match(/Faith Hill Baptist University/)
    end

    it "displays the speaker's talks" do 
      render
      expect(rendered).to have_content(@speaker.talks.first.title)
      expect(rendered).to have_content(@speaker.talks.last.title)
    end

    it "doesn't display the edit link" do 
      render
      expect(rendered).not_to have_link 'Edit'
    end

    it "doesn't display the destroy link" do 
      render
      expect(rendered).not_to have_link 'Destroy'
    end
  end

  context "when a user is logged in" do 
    before(:each) do
      @user = user

      def view.current_user; @user; end
    end

    it "renders attributes" do
      render
      expect(rendered).to match(/Bob Jones/)
      expect(rendered).to match(/http\:\/\/www\.bobjones\.edu/)
      expect(rendered).to match(/Faith Hill Baptist University/)
    end

    it "displays the speaker's talks" do 
      render
      expect(rendered).to have_content(@speaker.talks.first.title)
      expect(rendered).to have_content(@speaker.talks.last.title)
    end

    it "displays the edit link" do 
      render
      expect(rendered).to have_link 'Edit'
    end

    it "displays the destroy link" do 
      render
      expect(rendered).to have_link 'Destroy'
    end
  end
end
