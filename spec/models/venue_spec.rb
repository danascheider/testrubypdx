require 'rails_helper'

RSpec.describe Venue, type: :model do
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :address_1 }
  it { is_expected.to respond_to :address_2 }
  it { is_expected.to respond_to :city }
  it { is_expected.to respond_to :state }
  it { is_expected.to respond_to :zip }

  describe "defaults" do 
    let(:venue) { Venue.create(address_1: '400 SW 6th Ave.') }

    it "is in Portland" do
      expect(venue.city).to eql 'Portland'
    end

    it "is in Oregon" do 
      expect(venue.state).to eql 'Oregon'
    end
  end

  describe "validations" do 
    let(:venue) { FactoryGirl.create(:venue) }

    it "is invalid without an address" do 
      venue.address_1 = nil
      expect(venue).not_to be_valid
    end

    it "is invalid with a bad zip code" do 
      venue.zip = "97foobar"
      expect(venue).not_to be_valid
    end
  end
end
