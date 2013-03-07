require 'spec_helper'

describe "entries/edit" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :playa => nil,
      :white_card => nil,
      :black_card => nil,
      :wins => 1,
      :loses => 1,
      :draws => 1
    ))
  end

  it "renders the edit entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entry_path(@entry), "post" do
      assert_select "input#entry_playa[name=?]", "entry[playa]"
      assert_select "input#entry_white_card[name=?]", "entry[white_card]"
      assert_select "input#entry_black_card[name=?]", "entry[black_card]"
      assert_select "input#entry_wins[name=?]", "entry[wins]"
      assert_select "input#entry_loses[name=?]", "entry[loses]"
      assert_select "input#entry_draws[name=?]", "entry[draws]"
    end
  end
end
