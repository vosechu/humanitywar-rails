require 'spec_helper'

describe Entry do
  context "game scope" do
    before(:each) do
      @black_card = BlackCard.create!(:text => "test black", blanks => 1)
      @white_card = WhiteCard.create!(:text => "test white")
      @entry = Entry.create!(:white_card => @white_card, :black_card => @black_card)
      @entry2 = Entry.create!(:white_card => @white_card, :black_card => @black_card)
    end

    it "should return two entries" do
      Entry.game.length.should eql(2)
    end

    it "should return entry1/2" do

    end
  end

  context "not_multi scope" do
    it "should not return entries with blanks" do

    end
  end
end
