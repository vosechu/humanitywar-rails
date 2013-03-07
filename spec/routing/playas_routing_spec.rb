require "spec_helper"

describe PlayasController do
  describe "routing" do

    it "routes to #index" do
      get("/playas").should route_to("playas#index")
    end

    it "routes to #new" do
      get("/playas/new").should route_to("playas#new")
    end

    it "routes to #show" do
      get("/playas/1").should route_to("playas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/playas/1/edit").should route_to("playas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/playas").should route_to("playas#create")
    end

    it "routes to #update" do
      put("/playas/1").should route_to("playas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/playas/1").should route_to("playas#destroy", :id => "1")
    end

  end
end
