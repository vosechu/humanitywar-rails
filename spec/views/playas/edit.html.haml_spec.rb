require 'spec_helper'

describe "playas/edit" do
  before(:each) do
    @playa = assign(:playa, stub_model(Playa,
      :email => "MyString"
    ))
  end

  it "renders the edit playa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", playa_path(@playa), "post" do
      assert_select "input#playa_email[name=?]", "playa[email]"
    end
  end
end
