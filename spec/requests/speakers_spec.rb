require 'rails_helper'

RSpec.describe "Speakers", type: :request do
  describe "GET /speakers" do
    it "works! (now write some real specs)" do
      get speakers_path
      expect(response).to have_http_status(200)
    end
  end
end
