require 'spec_helper'

describe "playas/show" do
  before(:each) do
    @playa = assign(:playa, stub_model(Playa,
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
  end
end
