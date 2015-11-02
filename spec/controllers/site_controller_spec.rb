require 'rails_helper'

RSpec.describe SiteController, type: :controller do
  let(:valid_session) { {} }

  describe "GET #contact" do 
    it "renders the contact template" do 
      get :contact, {}, valid_session
      expect(response).to render_template('contact')
    end
  end

  describe "POST #send_mail" do 
    let(:valid_params) { {:name => 'Foo', :email => 'bar@baz.com'} }

    before(:each) do 
      FactoryGirl.create(:user, id: 1)
    end

    it "sets admin" do 
      post :send_mail, valid_params, valid_session
      expect(assigns(:admin)).to eql User.first
    end
  end
end
