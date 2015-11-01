require 'rails_helper'

RSpec.describe Meeting, type: :model do
  it { is_expected.to respond_to(:date) }
  it { is_expected.to respond_to(:description) }

  describe 'scopes' do 
    before(:each) do 
      @past_meetings = FactoryGirl.create_list(:past_meeting, 2)
      @upcoming_meetings = [FactoryGirl.create(:upcoming_meeting)]
    end

    describe 'past' do 
      it 'includes the past meetings only' do 
        expect(Meeting.past).to eq @past_meetings
      end
    end

    describe 'upcoming' do 
      it 'includes upcoming meetings only' do 
        expect(Meeting.upcoming).to eq @upcoming_meetings
      end
    end
  end

  describe 'validation' do 
    let(:valid_attributes) { { date: DateTime.now } }
    let(:invalid_attributes) { { description: 'It will be awesome!' } }

    it 'is valid with a date' do 
      meeting = Meeting.new(valid_attributes)
      expect(meeting).to be_valid
    end

    it 'is invalid without a date' do 
      meeting = Meeting.new(invalid_attributes)
      expect(meeting).not_to be_valid
    end
  end

  describe 'display_date' do 
    it 'gives the correct display date' do 
      meeting = FactoryGirl.create(:meeting, date: '2015-10-22')
      expect(meeting.display_date).to eql "Thursday, October 22, 2015"
    end
  end

  describe 'time' do 
    it 'returns the meeting time as a string' do
      meeting = FactoryGirl.create(:meeting)
      expect(meeting.time).to eql '6:12 pm'
    end
  end
end
