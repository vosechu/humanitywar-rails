require 'spec_helper'

describe "playas/index" do
  before(:each) do
    assign(:playas, [
      stub_model(Playa,
        :email => "Email"
      ),
      stub_model(Playa,
        :email => "Email"
      )
    ])
  end

  it "renders a list of playas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
