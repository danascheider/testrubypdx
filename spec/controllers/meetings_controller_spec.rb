require 'rails_helper'

RSpec.describe MeetingsController, type: :controller do
  let(:valid_attributes) {
    { date: DateTime.now }
  }

  let(:invalid_attributes) {
    { date: nil }
  }

  let(:valid_session) { {} }

  describe "GET #show" do
    let(:meeting) { FactoryGirl.create(:meeting) }

    it "assigns the requested meeting as @meeting" do
      get :show, {:id => meeting.to_param}, valid_session
      expect(assigns(:meeting)).to eq(meeting)
    end

    it "renders the show template" do 
      get :show, {:id => meeting.to_param}, valid_session
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    context "authorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(FactoryGirl.create(:user, id: 1))
      end

      it "assigns a new meeting as @meeting" do
        get :new, {}, valid_session
        expect(assigns(:meeting)).to be_a_new(Meeting)
      end

      it "renders the 'new' template" do 
        get :new, {}, valid_session
        expect(response).to render_template("new")
      end
    end

    context "unauthorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      end

      it "doesn\'t assign a new meeting" do 
        get :new, {}, valid_session
        expect(assigns(:meeting)).to be nil
      end

      it "redirects to the login page" do 
        get :new, {}, valid_session
        expect(response).to redirect_to '/login'
      end
    end
  end

  describe "GET #edit" do
    context "authorized" do 
      let(:meeting) { FactoryGirl.create(:meeting) }

      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(FactoryGirl.create(:user, id: 1))
      end

      it "assigns the requested meeting as @meeting" do
        get :edit, {:id => meeting.to_param}, valid_session
        expect(assigns(:meeting)).to eq(meeting)
      end

      it "renders the 'edit' template" do 
        get :edit, {:id => meeting.to_param}, valid_session
        expect(response).to render_template "edit"
      end
    end

    context "unauthorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      end

      it "redirects to the login page" do 
        meeting = FactoryGirl.create(:meeting)
        get :edit, {:id => meeting.to_param}, valid_session
        expect(response).to redirect_to '/login'
      end
    end
  end

  describe "GET #past" do 
    it "assigns the past meetings as @meetings" do 
      past = FactoryGirl.create_list(:past_meeting, 2)
      upcoming = FactoryGirl.create(:upcoming_meeting)
      get :past, valid_session
      expect(assigns(:meetings)).to eq past
    end

    it "renders the 'past' template" do 
      get :past, valid_session
      expect(response).to render_template("past")
    end
  end

  describe "GET #upcoming" do 
    it "assigns the upcoming meetings as @meetings" do 
      upcoming = [FactoryGirl.create(:upcoming_meeting)]
      past = FactoryGirl.create_list(:past_meeting, 2)
      get :upcoming, valid_session
      expect(assigns(:meetings)).to eq upcoming
    end

    it "renders the 'upcoming' template" do
      get :upcoming, valid_session
      expect(response).to render_template("upcoming")
    end
  end

  describe "POST #create" do
    context "authorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(FactoryGirl.create(:user, id: 1))
      end

      context "with valid params" do
        it "creates a new Meeting" do
          expect {
            post :create, {:meeting => valid_attributes}, valid_session
          }.to change(Meeting, :count).by(1)
        end

        it "assigns a newly created meeting as @meeting" do
          post :create, {:meeting => valid_attributes}, valid_session
          expect(assigns(:meeting)).to be_a(Meeting)
          expect(assigns(:meeting)).to be_persisted
        end

        it "redirects to the admin page" do
          post :create, {:meeting => valid_attributes}, valid_session
          expect(response).to redirect_to('/admin')
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved meeting as @meeting" do
          post :create, {:meeting => invalid_attributes}, valid_session
          expect(assigns(:meeting)).to be_a_new(Meeting)
        end

        it "redirects to the admin page" do
          post :create, {:meeting => invalid_attributes}, valid_session
          expect(response).to redirect_to("/admin")
        end
      end
    end

    context "unauthorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      end

      it "doesn't create a new meeting" do 
        expect {
          post :create, {:meeting => valid_attributes}, valid_session
        }.not_to change(Meeting, :count)
      end

      it "redirects to the login page" do 
        post :create, {:meeting => valid_attributes}, valid_session
        expect(response).to redirect_to '/login'
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {date: Date.tomorrow, description: 'The quick brown fox jumped over the lazy dog'}
      }

      context 'authorized' do 
        let(:meeting) { FactoryGirl.create(:meeting) }

        before(:each) do 
          user = FactoryGirl.create(:user, id: 1)
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        end

        it "updates the requested meeting" do
          put :update, {:id => meeting.to_param, :meeting => new_attributes}, valid_session
          meeting.reload
          expect(meeting.date).to eq Date.tomorrow
          expect(meeting.description).to eq 'The quick brown fox jumped over the lazy dog'
        end

        it "assigns the requested meeting as @meeting" do
          put :update, {:id => meeting.to_param, :meeting => valid_attributes}, valid_session
          expect(assigns(:meeting)).to eq meeting
        end

        it "redirects to the meeting" do
          put :update, {:id => meeting.to_param, :meeting => valid_attributes}, valid_session
          expect(response).to redirect_to(meeting)
        end
      end

      context 'unauthorized' do 
        before(:each) do 
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
        end

        it "doesn't update the requested meeting" do 
          meeting = FactoryGirl.create(:meeting)
          put :update, {:id => meeting.to_param, :meeting => new_attributes}, valid_session
          meeting.reload
          expect(meeting.description).not_to eq 'Foo bar baz'
        end

        it "redirects to the login page" do 
          meeting = FactoryGirl.create(:meeting)
          put :update, {:id => meeting.to_param, :meeting => new_attributes}, valid_session
          expect(response).to redirect_to('/login')
        end
      end
    end

    context "with invalid params" do
      context 'authorized' do 
        before(:each) do 
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(FactoryGirl.create(:user, id: 1))
        end

        it "assigns the meeting as @meeting" do
          meeting = FactoryGirl.create(:meeting)
          put :update, {:id => meeting.to_param, :meeting => invalid_attributes}, valid_session
          expect(assigns(:meeting)).to eq(meeting)
        end

        it "re-renders the 'edit' template" do
          meeting = FactoryGirl.create(:meeting)
          put :update, {:id => meeting.to_param, :meeting => invalid_attributes}, valid_session
          expect(response).to render_template("edit")
        end
      end
    end
  end

  describe "DELETE #destroy" do
    context 'authorized' do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(FactoryGirl.create(:user, id: 1))
      end

      context "past meeting" do 
        it "destroys the requested meeting" do
          meeting = FactoryGirl.create(:meeting)
          expect {
            delete :destroy, {:id => meeting.to_param}, valid_session
          }.to change(Meeting, :count).by(-1)
        end

        it "redirects to the past meetings list" do
          meeting = FactoryGirl.create(:meeting)
          delete :destroy, {:id => meeting.to_param}, valid_session
          expect(response).to redirect_to(past_meetings_url)
        end
      end

      context "upcoming meeting" do 
        it "destroys the requested meeting" do 
          meeting = FactoryGirl.create(:meeting, date: Date.tomorrow)
          expect{ 
            delete :destroy, {:id => meeting.to_param}, valid_session
            }.to change(Meeting, :count).by(-1)
        end

        it "redirects to the upcoming meetings list" do 
          meeting = FactoryGirl.create(:meeting, date: Date.tomorrow)
          delete :destroy, {:id => meeting.to_param}, valid_session
          expect(response).to redirect_to(upcoming_meetings_url)
        end
      end
    end

    context 'unauthorized' do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      end

      it "doesn\'t destroy the requested meeting" do 
        meeting = FactoryGirl.create(:meeting)
        expect {
          delete :destroy, {:id => meeting.to_param}, valid_session
        }.not_to change(Meeting, :count)
      end

      it "redirects to the login page" do 
        meeting = FactoryGirl.create(:meeting)
        delete :destroy, {:id => meeting.to_param}, valid_session
        expect(response).to redirect_to('/login')
      end
    end
  end

end
