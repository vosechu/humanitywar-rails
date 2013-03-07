require "spec_helper"

describe BlackCardsController do
  describe "routing" do

    it "routes to #index" do
      get("/black_cards").should route_to("black_cards#index")
    end

    it "routes to #new" do
      get("/black_cards/new").should route_to("black_cards#new")
    end

    it "routes to #show" do
      get("/black_cards/1").should route_to("black_cards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/black_cards/1/edit").should route_to("black_cards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/black_cards").should route_to("black_cards#create")
    end

    it "routes to #update" do
      put("/black_cards/1").should route_to("black_cards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/black_cards/1").should route_to("black_cards#destroy", :id => "1")
    end

  end
end
