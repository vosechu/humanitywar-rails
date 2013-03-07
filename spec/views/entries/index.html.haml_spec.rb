require 'spec_helper'

describe "entries/index" do
  before(:each) do
    assign(:entries, [
      stub_model(Entry,
        :playa => nil,
        :white_card => nil,
        :black_card => nil,
        :wins => 1,
        :loses => 2,
        :draws => 3
      ),
      stub_model(Entry,
        :playa => nil,
        :white_card => nil,
        :black_card => nil,
        :wins => 1,
        :loses => 2,
        :draws => 3
      )
    ])
  end

  it "renders a list of entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
