require 'spec_helper'

describe "black_cards/show" do
  before(:each) do
    @black_card = assign(:black_card, stub_model(BlackCard,
      :text => "Text",
      :blanks => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Text/)
    rendered.should match(/1/)
  end
end
