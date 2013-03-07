require 'spec_helper'

describe "white_cards/show" do
  before(:each) do
    @white_card = assign(:white_card, stub_model(WhiteCard,
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Text/)
  end
end
