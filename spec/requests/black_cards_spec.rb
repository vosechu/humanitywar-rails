require 'spec_helper'

describe "BlackCards" do
  describe "GET /black_cards" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get black_cards_path
      response.status.should be(200)
    end
  end
end
