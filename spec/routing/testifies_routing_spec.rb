require "rails_helper"

RSpec.describe TestifiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/testifies").to route_to("testifies#index")
    end

    it "routes to #new" do
      expect(:get => "/testifies/new").to route_to("testifies#new")
    end

    it "routes to #show" do
      expect(:get => "/testifies/1").to route_to("testifies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/testifies/1/edit").to route_to("testifies#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/testifies").to route_to("testifies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/testifies/1").to route_to("testifies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/testifies/1").to route_to("testifies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/testifies/1").to route_to("testifies#destroy", :id => "1")
    end
  end
end
