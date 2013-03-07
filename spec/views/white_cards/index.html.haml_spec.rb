require 'spec_helper'

describe "white_cards/index" do
  before(:each) do
    assign(:white_cards, [
      stub_model(WhiteCard,
        :text => "Text"
      ),
      stub_model(WhiteCard,
        :text => "Text"
      )
    ])
  end

  it "renders a list of white_cards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
