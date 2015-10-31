require 'rails_helper'

RSpec.describe "speakers/index", type: :view do
  let(:user) { FactoryGirl.create(:user, id: 1) }
  before(:each) do
    assign(:speakers, FactoryGirl.create_list(:speaker, 2))
  end

  context "user is logged in" do 
    before(:each) do 
      @user = user

      def view.current_user; @user; end
    end

    it "renders a list of speakers" do
      render
      assert_select "tr>td", :text => Speaker.first.first_name
      assert_select "tr>td", :text => Speaker.last.first_name
      assert_select "tr>td", :text => Speaker.first.last_name
      assert_select "tr>td", :text => Speaker.last.last_name
      assert_select "tr>td", :text => Speaker.first.website
      assert_select "tr>td", :text => Speaker.last.website
      assert_select "tr>td", :text => Speaker.first.company
      assert_select "tr>td", :text => Speaker.last.company
    end

    it "displays edit links" do 
      render
      expect(rendered).to have_link 'Edit', :count => 2
    end

    it "displays destroy links" do 
      render
      expect(rendered).to have_link 'Destroy', :count => 2
    end
  end

  context "user is not logged in" do 
    before(:each) do 
      def view.current_user; nil; end
    end

    it "renders a list of speakers" do
      render
      assert_select "tr>td", :text => Speaker.first.first_name
      assert_select "tr>td", :text => Speaker.last.first_name
      assert_select "tr>td", :text => Speaker.first.last_name
      assert_select "tr>td", :text => Speaker.last.last_name
      assert_select "tr>td", :text => Speaker.first.website
      assert_select "tr>td", :text => Speaker.last.website
      assert_select "tr>td", :text => Speaker.first.company
      assert_select "tr>td", :text => Speaker.last.company
    end

    it "doesn't display edit links" do 
      render
      expect(rendered).not_to have_link 'Edit', :count => 2
    end

    it "doesn't display destroy links" do 
      render
      expect(rendered).not_to have_link 'Destroy', :count => 2
    end
  end
end
