require 'spec_helper'

describe "white_cards/new" do
  before(:each) do
    assign(:white_card, stub_model(WhiteCard,
      :text => "MyString"
    ).as_new_record)
  end

  it "renders new white_card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", white_cards_path, "post" do
      assert_select "input#white_card_text[name=?]", "white_card[text]"
    end
  end
end
