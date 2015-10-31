require 'rails_helper'

RSpec.describe SpeakersController, type: :controller do
  let(:user) { FactoryGirl.create(:user, id: 1) }

  let(:valid_attributes) {
    {first_name: 'Craig', last_name: 'Smith'}
  }

  let(:invalid_attributes) {
    {first_name: nil}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all speakers as @speakers" do
      speaker = FactoryGirl.create(:speaker, valid_attributes)
      get :index, {}, valid_session
      expect(assigns(:speakers)).to eq([speaker])
    end
  end

  describe "GET #show" do
    it "assigns the requested speaker as @speaker" do
      speaker = FactoryGirl.create(:speaker, valid_attributes)
      get :show, {:id => speaker.to_param}, valid_session
      expect(assigns(:speaker)).to eq(speaker)
    end
  end

  describe "GET #new" do
    context "authorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      end

      it "assigns a new speaker as @speaker" do
        get :new, {}, valid_session
        expect(assigns(:speaker)).to be_a_new(Speaker)
      end

      it "renders the form" do 
        get :new, {}, valid_session
        expect(response).to render_template 'new'
      end
    end

    context "unauthorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      end

      it "redirects to login" do 
        get :new, {}, valid_session
        expect(response).to redirect_to '/login'
      end
    end
  end

  describe "GET #edit" do
    context "authorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      end

      it "assigns the requested speaker as @speaker" do
        speaker = FactoryGirl.create(:speaker, valid_attributes)
        get :edit, {:id => speaker.to_param}, valid_session
        expect(assigns(:speaker)).to eq(speaker)
      end

      it "renders the edit form" do 
        speaker = FactoryGirl.create(:speaker, valid_attributes)
        get :edit, {:id => speaker.to_param}, valid_session
        expect(response).to render_template 'edit'
      end
    end

    context "unauthorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      end

      it "redirects to login" do 
        speaker = FactoryGirl.create(:speaker, valid_attributes)
        get :edit, {:id => speaker.to_param}, valid_session
        expect(response).to redirect_to '/login'
      end
    end
  end

  describe "POST #create" do
    context "authorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(FactoryGirl.create(:user, id: 1))
      end

      context "with valid params" do
        it "creates a new Speaker" do
          expect {
            post :create, {:speaker => valid_attributes}, valid_session
          }.to change(Speaker, :count).by(1)
        end

        it "assigns a newly created speaker as @speaker" do
          post :create, {:speaker => valid_attributes}, valid_session
          expect(assigns(:speaker)).to be_a(Speaker)
          expect(assigns(:speaker)).to be_persisted
        end

        it "redirects to the created speaker" do
          post :create, {:speaker => valid_attributes}, valid_session
          expect(response).to redirect_to(Speaker.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved speaker as @speaker" do
          post :create, {:speaker => invalid_attributes}, valid_session
          expect(assigns(:speaker)).to be_a_new(Speaker)
        end

        it "re-renders the 'new' template" do
          post :create, {:speaker => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    context "unauthorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      end

      it "does not create a new speaker" do 
        expect{
          post :create, {:speaker => valid_attributes}, valid_session
        }.not_to change(Speaker, :count)
      end

      it "redirects to the login page" do 
        post :create, {:speaker => valid_attributes}, valid_session
        expect(response).to redirect_to '/login'
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {company: 'Puppet Labs'}
      }

      it "updates the requested speaker" do
        speaker = FactoryGirl.create(:speaker, valid_attributes)
        put :update, {:id => speaker.to_param, :speaker => new_attributes}, valid_session
        speaker.reload
        expect(speaker.company).to eql 'Puppet Labs'
      end

      it "assigns the requested speaker as @speaker" do
        speaker = FactoryGirl.create(:speaker, valid_attributes)
        put :update, {:id => speaker.to_param, :speaker => valid_attributes}, valid_session
        expect(assigns(:speaker)).to eq(speaker)
      end

      it "redirects to the speaker" do
        speaker = FactoryGirl.create(:speaker, valid_attributes)
        put :update, {:id => speaker.to_param, :speaker => valid_attributes}, valid_session
        expect(response).to redirect_to(speaker)
      end
    end

    context "with invalid params" do
      it "assigns the speaker as @speaker" do
        speaker = FactoryGirl.create(:speaker, valid_attributes)
        put :update, {:id => speaker.to_param, :speaker => invalid_attributes}, valid_session
        expect(assigns(:speaker)).to eq(speaker)
      end

      it "re-renders the 'edit' template" do
        speaker = FactoryGirl.create(:speaker, valid_attributes)
        put :update, {:id => speaker.to_param, :speaker => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested speaker" do
      speaker = FactoryGirl.create(:speaker, valid_attributes)
      expect {
        delete :destroy, {:id => speaker.to_param}, valid_session
      }.to change(Speaker, :count).by(-1)
    end

    it "redirects to the speakers list" do
      speaker = FactoryGirl.create(:speaker, valid_attributes)
      delete :destroy, {:id => speaker.to_param}, valid_session
      expect(response).to redirect_to(speakers_url)
    end
  end

end
