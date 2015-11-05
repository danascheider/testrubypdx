require 'rails_helper'

RSpec.describe VenuesController, type: :controller do
  let(:user) { FactoryGirl.create(:user, id: 1) }

  let(:valid_attributes) {
    {:name => 'Renew Financial', address_1: '400 SW 6th Ave. #902'}
  }

  let(:invalid_attributes) {
    {:name => 'Renew Financial'}
  }

  let(:valid_session) { {} }

  describe "GET #show" do
    it "assigns the requested venue as @venue" do
      venue = FactoryGirl.create(:venue)
      get :show, {:id => venue.to_param}, valid_session
      expect(assigns(:venue)).to eq(venue)
    end
  end

  describe "GET #new" do
    context "authorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      end

      it "assigns a new venue as @venue" do
        get :new, {}, valid_session
        expect(assigns(:venue)).to be_a_new(Venue)
      end
    end

    context "unauthorized" do 
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

      it "assigns the requested venue as @venue" do
        venue = FactoryGirl.create(:venue)
        get :edit, {:id => venue.to_param}, valid_session
        expect(assigns(:venue)).to eq(venue)
      end
    end

    context "unauthorized" do 
      it "redirects to login" do 
        venue = FactoryGirl.create(:venue)
        get :edit, {:id => venue.to_param}, valid_session
        expect(response).to redirect_to '/login'
      end
    end
  end

  describe "POST #create" do
    context "authorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      end

      context "with valid params" do
        it "creates a new Venue" do
          expect {
            post :create, {:venue => valid_attributes}, valid_session
          }.to change(Venue, :count).by(1)
        end

        it "assigns a newly created venue as @venue" do
          post :create, {:venue => valid_attributes}, valid_session
          expect(assigns(:venue)).to be_a(Venue)
          expect(assigns(:venue)).to be_persisted
        end

        it "redirects to the created venue" do
          post :create, {:venue => valid_attributes}, valid_session
          expect(response).to redirect_to(Venue.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved venue as @venue" do
          post :create, {:venue => invalid_attributes}, valid_session
          expect(assigns(:venue)).to be_a_new(Venue)
        end

        it "re-renders the 'new' template" do
          post :create, {:venue => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    context "unauthorized" do 
      it "redirects to login" do 
        post :create, {:venue => valid_attributes}, valid_session
        expect(response).to redirect_to '/login'
      end
    end
  end

  describe "PUT #update" do
    context "authorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      end

      context "with valid params" do
        let(:new_attributes) {
          {:city => 'Beaverton'}
        }

        it "updates the requested venue" do
          venue = FactoryGirl.create(:venue)
          put :update, {:id => venue.to_param, :venue => new_attributes}, valid_session
          venue.reload
          expect(venue.city).to eql 'Beaverton'
        end

        it "assigns the requested venue as @venue" do
          venue = FactoryGirl.create(:venue)
          put :update, {:id => venue.to_param, :venue => valid_attributes}, valid_session
          expect(assigns(:venue)).to eq(venue)
        end

        it "redirects to the venue" do
          venue = FactoryGirl.create(:venue)
          put :update, {:id => venue.to_param, :venue => valid_attributes}, valid_session
          expect(response).to redirect_to(venue)
        end
      end

      context "with invalid params" do
        it "assigns the venue as @venue" do
          venue = FactoryGirl.create(:venue)
          put :update, {:id => venue.to_param, :venue => {:address_1 => nil}}, valid_session
          expect(assigns(:venue)).to eq(venue)
        end

        it "re-renders the 'edit' template" do
          venue = FactoryGirl.create(:venue)
          put :update, {:id => venue.to_param, :venue => {:address_1 => nil}}, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    context "unauthorized" do 
      it "redirects to login" do 
        venue = FactoryGirl.create(:venue)
        put :update, {:id => venue.to_param, :venue => {:city => 'Beaverton'}}, valid_session
        expect(response).to redirect_to '/login'
      end
    end
  end

  describe "DELETE #destroy" do
    context "authorized" do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      end

      it "destroys the requested venue" do
        venue = FactoryGirl.create(:venue)
        expect {
          delete :destroy, {:id => venue.to_param}, valid_session
        }.to change(Venue, :count).by(-1)
      end

      it "redirects to the venues list" do
        venue = FactoryGirl.create(:venue)
        delete :destroy, {:id => venue.to_param}, valid_session
        expect(response).to redirect_to('/admin')
      end
    end

    context "unauthorized" do 
      it "redirects to login" do 
        venue = FactoryGirl.create(:venue)
        delete :destroy, {:id => venue.to_param}, valid_session
        expect(response).to redirect_to('/login')
      end

      it "doesn't destroy the requested venue" do 
        venue = FactoryGirl.create(:venue)
        expect{ 
          delete :destroy, {:id => venue.to_param}, valid_session
          }.not_to change(Venue, :count)
      end
    end
  end

end
