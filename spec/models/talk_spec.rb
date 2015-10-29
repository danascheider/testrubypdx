require 'rails_helper'

RSpec.describe Talk, type: :model do
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:description) }

  describe "validations" do 
    let(:talk) { Talk.new(title: 'All About RSpec') }

    it "is invalid without a title" do 
      talk.title = nil
      expect(talk).not_to be_valid
    end
  end
end
