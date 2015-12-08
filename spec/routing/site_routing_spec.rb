require 'rails_helper'

RSpec.describe SiteController, type: :routing do 
  describe "routing" do 
    it "routes to #about" do 
      expect(:get => "/about").to route_to("site#about")
    end

    it "routes to #contact" do 
      expect(:get => "/contact").to route_to("site#contact")
    end

    it "routes to #send_mail" do 
      expect(:post => "/contact").to route_to("site#send_mail")
    end

    it "routes to #admin" do 
      expect(:get => "/admin").to route_to("site#admin")
    end

    it "routes to #speak" do 
      expect(:get => "/speak").to route_to("site#speak")
    end
  end
end