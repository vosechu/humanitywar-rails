require 'spec_helper'

describe "black_cards/new" do
  before(:each) do
    assign(:black_card, stub_model(BlackCard,
      :text => "MyString",
      :blanks => 1
    ).as_new_record)
  end

  it "renders new black_card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", black_cards_path, "post" do
      assert_select "input#black_card_text[name=?]", "black_card[text]"
      assert_select "input#black_card_blanks[name=?]", "black_card[blanks]"
    end
  end
end
