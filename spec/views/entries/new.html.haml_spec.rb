require 'spec_helper'

describe "entries/new" do
  before(:each) do
    assign(:entry, stub_model(Entry,
      :playa => nil,
      :white_card => nil,
      :black_card => nil,
      :wins => 1,
      :loses => 1,
      :draws => 1
    ).as_new_record)
  end

  it "renders new entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entries_path, "post" do
      assert_select "input#entry_playa[name=?]", "entry[playa]"
      assert_select "input#entry_white_card[name=?]", "entry[white_card]"
      assert_select "input#entry_black_card[name=?]", "entry[black_card]"
      assert_select "input#entry_wins[name=?]", "entry[wins]"
      assert_select "input#entry_loses[name=?]", "entry[loses]"
      assert_select "input#entry_draws[name=?]", "entry[draws]"
    end
  end
end
