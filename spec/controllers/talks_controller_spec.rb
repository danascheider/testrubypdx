require 'rails_helper'

RSpec.describe TalksController, type: :controller do
  let(:user) { FactoryGirl.create(:user, id: 1) }

  let(:valid_attributes) {
    { title: 'MiniTest Is the Best' }
  }

  let(:invalid_attributes) {
    { title: nil }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all talks as @talks" do
      talk = FactoryGirl.create(:talk, valid_attributes)
      get :index, {}, valid_session
      expect(assigns(:talks)).to eq([talk])
    end

    it "assigns only one speaker's talks as @talks" do 
      speaker = FactoryGirl.create(:speaker)
      talk1, talk2 = FactoryGirl.create(:talk, :speaker_id => speaker.id), FactoryGirl.create(:talk)
      get :index, {:speaker_id => speaker.id}, valid_session
      expect(assigns(:talks)).to eq [talk1]
    end

    it "assigns only one meeting's talks as @talks" do 
      meeting = FactoryGirl.create(:meeting)
      talk1, talk2 = FactoryGirl.create(:talk, :meeting_id => meeting.id), FactoryGirl.create(:talk)
      get :index, {:meeting_id => meeting.id}, valid_session
      expect(assigns(:talks)).to eq [talk1]
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
    context "authorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      end

      it "assigns the requested talk as @talk" do
        talk = FactoryGirl.create(:talk, valid_attributes)
        get :edit, {:id => talk.to_param}, valid_session
        expect(assigns(:talk)).to eq(talk)
      end

      it "renders the view" do 
        talk = FactoryGirl.create(:talk, valid_attributes)
        get :edit, {:id => talk.to_param}, valid_session
        expect(response).to render_template 'edit'
      end
    end

    context "unauthorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      end

      it "redirects to the /login page" do 
        talk = FactoryGirl.create(:talk, valid_attributes)
        get :edit, {:id => talk.to_param}, valid_session
        expect(response).to redirect_to '/login'
      end
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

        it "adds the speaker_id if appropriate" do 
          speaker = FactoryGirl.create(:speaker)
          valid_attributes[:speaker_id] = speaker.id
          post :create, {:talk => valid_attributes}, valid_session
          expect(assigns(:talk).speaker_id).to eql speaker.id
        end

        it "adds the meeting_id if appropriate" do 
          meeting = FactoryGirl.create(:meeting)
          valid_attributes[:meeting_id] = meeting.id
          post :create, {:talk => valid_attributes}, valid_session
          expect(assigns(:talk).meeting_id).to eql meeting.id
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

      context "authorized" do 
        before(:each) do 
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        end

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
      end
    end

    context "unauthorized" do 
      let(:new_attributes) {
        { :description => 'This talk will be awesome' }
      }

      it "redirects to the login page" do 
        talk = FactoryGirl.create(:talk, valid_attributes)
        put :update, {:id => talk.to_param, :talk => new_attributes}, valid_session
        expect(response).to redirect_to '/login'
      end

      it "doesn't update the talk" do 
        talk = FactoryGirl.create(:talk, valid_attributes)
        put :update, {:id => talk.to_param, :talk => new_attributes}, valid_session
        talk.reload
        expect(talk.description).not_to eql 'This talk will be awesome'
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
