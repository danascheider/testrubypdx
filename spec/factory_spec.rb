require 'rails_helper'

describe 'factories' do 
  describe 'user' do 
    let(:user) { FactoryGirl.create(:user) }

    it 'creates a user' do 
      expect{ FactoryGirl.create(:user) }.to change(User, :count).by(1)
    end

    it 'has a unique e-mail' do 
      new_user = FactoryGirl.create(:user)
      expect(user.email).not_to eql new_user.email
    end

    it 'has a unique username' do 
      new_user = FactoryGirl.create(:user)
      expect(user.name).not_to eql new_user.name
    end

    it 'has a password' do 
      expect(user.password).not_to be_nil
    end
  end

  describe 'meeting' do 
    #
  end
end