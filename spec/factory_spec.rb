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
    context 'basic' do 
      let(:meeting) { FactoryGirl.create(:meeting) }

      it 'has a date' do 
        expect(meeting.date).not_to be_nil
      end
    end

    context 'past meeting' do 
      let(:meeting) { FactoryGirl.create(:past_meeting) }

      it 'is in the past' do 
        expect(meeting.date).to be_past
      end
    end

    context 'upcoming meeting' do 
      let(:meeting) { FactoryGirl.create(:upcoming_meeting) }

      it 'is in the future' do 
        expect(meeting.date).to be_future
      end
    end
  end

  describe 'talk' do 
    context 'basic' do 
      let(:talk) { FactoryGirl.create(:talk) }

      it 'has a title' do 
        expect(talk.title).not_to be_nil
      end
    end
  end
end