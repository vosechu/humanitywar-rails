require 'spec_helper'

describe "playas/new" do
  before(:each) do
    assign(:playa, stub_model(Playa,
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new playa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", playas_path, "post" do
      assert_select "input#playa_email[name=?]", "playa[email]"
    end
  end
end
