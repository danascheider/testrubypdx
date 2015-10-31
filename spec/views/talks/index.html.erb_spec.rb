require 'rails_helper'

RSpec.describe "talks/index", type: :view do
  before(:each) do
    assign(:talks, FactoryGirl.create_list(:talk, 2))
  end

  context "logged-in user" do 
    let(:user) { FactoryGirl.create(:user, id: 1) }

    before(:each) do 
      @user = user

      def view.current_user
        @user
      end
    end

    it "renders a list of talks" do
      render
      assert_select "tr>td", :text => Talk.first.title
      assert_select "tr>td", :text => Talk.last.title
      assert_select "tr>td", :text => Talk.first.speaker.name
      assert_select "tr>td", :text => Talk.last.speaker.name
      assert_select "tr>td", :text => Talk.first.description
      assert_select "tr>td", :text => Talk.last.description
    end

    it "displays the edit links" do 
      render
      assert_select "a", :text => 'Edit', :count => 2
    end

    it "displays the destroy links" do 
      render
      assert_select "a", :text => 'Destroy', :count => 2
    end
  end

  context "no logged-in user" do 
    before(:each) do 
      def view.current_user
        nil
      end
    end

    it "renders a list of talks" do
      render
      assert_select "tr>td", :text => Talk.first.title
      assert_select "tr>td", :text => Talk.last.title
      assert_select "tr>td", :text => Talk.first.speaker.name
      assert_select "tr>td", :text => Talk.last.speaker.name
      assert_select "tr>td", :text => Talk.first.description
      assert_select "tr>td", :text => Talk.last.description
    end

    it "doesn't display the edit links" do 
      render
      assert_select "a", :text => 'Edit', :count => 0
    end

    it "doesn't display the destroy links" do 
      render
      assert_select "a", :text => 'Destroy', :count => 0
    end
  end
end
