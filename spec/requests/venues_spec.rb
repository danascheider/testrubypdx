require 'rails_helper'

RSpec.describe "Venues", type: :request do
  let(:venue) { FactoryGirl.create(:venue) }

  describe "GET /venues" do
    it "works! (now write some real specs)" do
      get venue_path venue
      expect(response).to have_http_status(200)
    end
  end
end
