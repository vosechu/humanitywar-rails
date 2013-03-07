require 'spec_helper'

describe "white_cards/edit" do
  before(:each) do
    @white_card = assign(:white_card, stub_model(WhiteCard,
      :text => "MyString"
    ))
  end

  it "renders the edit white_card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", white_card_path(@white_card), "post" do
      assert_select "input#white_card_text[name=?]", "white_card[text]"
    end
  end
end
