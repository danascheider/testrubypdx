require 'rails_helper'

RSpec.describe TalksController, type: :controller do
  let(:valid_attributes) {
    { title: 'MiniTest Is the Best' }
  }

  let(:invalid_attributes) {
    { title: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TalksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all talks as @talks" do
      talk = FactoryGirl.create(:talk, valid_attributes)
      get :index, {}, valid_session
      expect(assigns(:talks)).to eq([talk])
    end
  end

  describe "GET #show" do
    it "assigns the requested talk as @talk" do
      talk = FactoryGirl.create(:talk, valid_attributes)
      get :show, {:id => talk.to_param}, valid_session
      expect(assigns(:talk)).to eq(talk)
    end
  end

  describe "GET #new" do
    context "authorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(FactoryGirl.create(:user, id: 1))
      end

      it "assigns a new talk as @talk" do
        get :new, {}, valid_session
        expect(assigns(:talk)).to be_a_new(Talk)
      end

      it "renders the new talk form" do 
        get :new, {}, valid_session
        expect(response).to render_template('talks/new')
      end
    end

    context "unauthorized" do 
      it "redirects to the login page" do 
        get :new, {}, valid_session
        expect(response).to redirect_to '/login'
      end
    end
  end

  describe "GET #edit" do
    it "assigns the requested talk as @talk" do
      talk = FactoryGirl.create(:talk, valid_attributes)
      get :edit, {:id => talk.to_param}, valid_session
      expect(assigns(:talk)).to eq(talk)
    end
  end

  describe "POST #create" do
    context "authorized" do 
      before(:each) do 
        user = FactoryGirl.create(:user, id: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      end

      context "with valid params" do
        it "creates a new Talk" do
          expect {
            post :create, {:talk => valid_attributes}, valid_session
          }.to change(Talk, :count).by(1)
        end

        it "assigns a newly created talk as @talk" do
          post :create, {:talk => valid_attributes}, valid_session
          expect(assigns(:talk)).to be_a(Talk)
          expect(assigns(:talk)).to be_persisted
        end

        it "redirects to the created talk" do
          post :create, {:talk => valid_attributes}, valid_session
          expect(response).to redirect_to(Talk.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved talk as @talk" do
          post :create, {:talk => invalid_attributes}, valid_session
          expect(assigns(:talk)).to be_a_new(Talk)
        end

        it "re-renders the 'new' template" do
          post :create, {:talk => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    context "unauthorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      end

      it "redirects to the login page" do 
        post :create, {:talk => valid_attributes}, valid_session
        expect(response).to redirect_to '/login'
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { description: 'This talk will be awesome' }
      }

      it "updates the requested talk" do
        talk = FactoryGirl.create(:talk, valid_attributes)
        put :update, {:id => talk.to_param, :talk => new_attributes}, valid_session
        talk.reload
        expect(talk.description).to eql 'This talk will be awesome'
      end

      it "assigns the requested talk as @talk" do
        talk = FactoryGirl.create(:talk, valid_attributes)
        put :update, {:id => talk.to_param, :talk => valid_attributes}, valid_session
        expect(assigns(:talk)).to eq(talk)
      end

      it "redirects to the talk" do
        talk = FactoryGirl.create(:talk, valid_attributes)
        put :update, {:id => talk.to_param, :talk => valid_attributes}, valid_session
        expect(response).to redirect_to(talk)
      end
    end

    context "with invalid params" do
      it "assigns the talk as @talk" do
        talk = FactoryGirl.create(:talk, valid_attributes)
        put :update, {:id => talk.to_param, :talk => invalid_attributes}, valid_session
        expect(assigns(:talk)).to eq(talk)
      end

      it "re-renders the 'edit' template" do
        talk = FactoryGirl.create(:talk, valid_attributes)
        put :update, {:id => talk.to_param, :talk => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested talk" do
      talk = FactoryGirl.create(:talk, valid_attributes)
      expect {
        delete :destroy, {:id => talk.to_param}, valid_session
      }.to change(Talk, :count).by(-1)
    end

    it "redirects to the talks list" do
      talk = FactoryGirl.create(:talk, valid_attributes)
      delete :destroy, {:id => talk.to_param}, valid_session
      expect(response).to redirect_to(talks_url)
    end
  end

end
