require 'spec_helper'

describe "WhiteCard" do
  before(:each) do
    @card = WhiteCard.create(:text => "blah")
  end

  it 'should create a new whitecard' do
    @card.should be_an_instance_of(WhiteCard)
  end
  it 'should return text from database from an existing record' do
    @card.text.should be_an_instance_of(String)
  end
  it 'should respond to to_s' do
    @card.to_s.should eql "blah"
  end

  context "with no entries" do
    it 'should not habtm entries' do
      @card.entries.count.should eql 0
    end
  end

  context "with some entries" do
    before(:each) do
      @card.entries << Entry.create
    end

    it 'should habtm entries' do
      @card.entries.count.should eql 1
    end
  end
end
