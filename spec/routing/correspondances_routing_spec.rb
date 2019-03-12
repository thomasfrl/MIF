require "rails_helper"

RSpec.describe CorrespondancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/correspondances").to route_to("correspondances#index")
    end

    it "routes to #new" do
      expect(:get => "/correspondances/new").to route_to("correspondances#new")
    end

    it "routes to #show" do
      expect(:get => "/correspondances/1").to route_to("correspondances#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/correspondances/1/edit").to route_to("correspondances#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/correspondances").to route_to("correspondances#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/correspondances/1").to route_to("correspondances#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/correspondances/1").to route_to("correspondances#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/correspondances/1").to route_to("correspondances#destroy", :id => "1")
    end
  end
end
