require 'spec_helper'

describe "black_cards/index" do
  before(:each) do
    assign(:black_cards, [
      stub_model(BlackCard,
        :text => "Text",
        :blanks => 1
      ),
      stub_model(BlackCard,
        :text => "Text",
        :blanks => 1
      )
    ])
  end

  it "renders a list of black_cards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
