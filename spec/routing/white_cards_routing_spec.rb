require "spec_helper"

describe WhiteCardsController do
  describe "routing" do

    it "routes to #index" do
      get("/white_cards").should route_to("white_cards#index")
    end

    it "routes to #new" do
      get("/white_cards/new").should route_to("white_cards#new")
    end

    it "routes to #show" do
      get("/white_cards/1").should route_to("white_cards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/white_cards/1/edit").should route_to("white_cards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/white_cards").should route_to("white_cards#create")
    end

    it "routes to #update" do
      put("/white_cards/1").should route_to("white_cards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/white_cards/1").should route_to("white_cards#destroy", :id => "1")
    end

  end
end
