require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {
    {id: 1, name: 'user123', password: 'foobarbaz', email: 'foobar@baz.com'}
  }

  let(:invalid_attributes) {
    { email: nil }
  }

  let(:valid_session) { {} }

  describe "GET #show" do
    it "assigns the requested user as @user" do
      user = FactoryGirl.create(:user, valid_attributes)
      get :show, {:id => user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end

    context "unauthorized" do 
      let(:user) { FactoryGirl.create(:user) }

      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      end

      it "shows the login page" do 
        get :show, {:id => user.to_param}, valid_session
        expect(response).to redirect_to '/login'
      end
    end
  end

  describe "GET #new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "GET #edit" do
    it "assigns the requested user as @user" do
      user = FactoryGirl.create(:user, valid_attributes)
      get :edit, {:id => user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end

    context "unauthorized" do 
      let(:user) { FactoryGirl.create(:user, valid_attributes) }
      
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      end

      it "routes to the loginpage" do 
        get :edit, { :id => user.to_param }
        expect(response).to redirect_to "/login"
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the root path" do
        post :create, {:user => valid_attributes}, valid_session
        expect(response).to redirect_to('/')
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { first_name: 'Bob' }
      }

      it "updates the requested user" do
        user = FactoryGirl.create(:user, valid_attributes)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        put :update, {:id => user.to_param, :user => new_attributes}, valid_session
        user.reload
        expect(user.first_name).to eq 'Bob'
      end

      it "assigns the requested user as @user" do
        user = FactoryGirl.create(:user, valid_attributes)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        user = FactoryGirl.create(:user, valid_attributes)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        expect(response).to redirect_to(user)
      end
    end

    context "with invalid params" do
      let(:user) { FactoryGirl.create(:user, valid_attributes) }

      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        put :update, {:id => user.to_param, :user => invalid_attributes}, valid_session
      end

      it "assigns the user as @user" do
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template("edit")
      end
    end

    context "unauthorized" do 
      let(:new_attributes) { {first_name: 'Bob' } }
      let(:user) { FactoryGirl.create(:user, valid_attributes) }

      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
        put :update, {:id => user.to_param, :user => new_attributes}, valid_session
      end

      it 'doesn\'t update the user' do 
        user.reload
        expect(user.first_name).not_to eql 'Bob'
      end

      it 'redirects to the login page' do 
        expect(response).to redirect_to('/login')
      end
    end
  end

  describe "DELETE #destroy" do
    let(:user) { FactoryGirl.create(:user, valid_attributes) }

    let(:orig_id) { user.id }

    context 'authorized' do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      end

      it "destroys the requested user" do
        expect{
          delete :destroy, {:id => user.to_param}, valid_session
        }.to change(User, :count).by(-1)
      end

      it "redirects to the homepage" do
        delete :destroy, {:id => user.to_param}, valid_session
        expect(response).to redirect_to('/')
      end
    end

    context 'unauthorized' do 
      before(:each) do 
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      end

      it 'doesn\'t destroy the requested user' do 
        # `user` needs to be called outside the expect block so the user
        # is not created in the block, which causes User.count to increment
        user

        expect{ 
          delete :destroy, {:id => user.to_param}, valid_session
        }.not_to change(User, :count)
      end

      it 'redirects to the login page' do 
        user # should exist before the delete request is made, for realism

        delete :destroy, {:id => user.to_param}, valid_session
        expect(response).to redirect_to '/login'
      end
    end
  end

end
