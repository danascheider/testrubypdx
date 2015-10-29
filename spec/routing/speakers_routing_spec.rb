require "rails_helper"

RSpec.describe SpeakersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/speakers").to route_to("speakers#index")
    end

    it "routes to #new" do
      expect(:get => "/speakers/new").to route_to("speakers#new")
    end

    it "routes to #show" do
      expect(:get => "/speakers/1").to route_to("speakers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/speakers/1/edit").to route_to("speakers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/speakers").to route_to("speakers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/speakers/1").to route_to("speakers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/speakers/1").to route_to("speakers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/speakers/1").to route_to("speakers#destroy", :id => "1")
    end

  end
end
