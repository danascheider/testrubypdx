require 'rails_helper'

RSpec.describe Speaker, type: :model do
  it { is_expected.to respond_to :first_name }
  it { is_expected.to respond_to :last_name }
  it { is_expected.to respond_to :company }
  it { is_expected.to respond_to :website }
  it { is_expected.to respond_to :bio }

  describe "validations" do 
    let(:speaker) { Speaker.new(first_name: 'Bob', last_name: 'Smith') }

    it "is invalid without a first name" do 
      speaker.first_name = nil
      expect(speaker).not_to be_valid
    end
  end
end
