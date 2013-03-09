require 'spec_helper'

describe Entry do
  context "game scope" do
    before(:each) do
      @black_card = BlackCard.create!(:text => "test black", :blanks => 1)
      @white_card = WhiteCard.create!(:text => "test white")
      @entry = Entry.create!(:white_card => @white_card, :black_card => @black_card)
      @entry2 = Entry.create!(:white_card => @white_card, :black_card => @black_card)
    end

    it "should return two entries" do
      Entry.game.length.should eql(2)
    end

    it "should return entry1/2" do
      Entry.game.sort.should eql([@entry, @entry2])
    end
  end

  context "not_multi scope" do
    before(:each) do
      @black_card_2_blanks = BlackCard.create!(:text => "test black", :blanks => 2)
      @black_card_1_blank = BlackCard.create!(:text => "test black", :blanks => 1)
      @entry_1_blank = Entry.create!(:white_card => @white_card, :black_card => @black_card_1_blank)
      @entry_2_blanks = Entry.create!(:white_card => @white_card, :black_card => @black_card_2_blanks)
    end

    it "should not return entries with blanks" do
      Entry.not_multi.should include(@entry_1_blank)
      Entry.not_multi.should_not include(@entry_2_blanks)
    end
  end

  context "easy_game pseudo-scope" do
    before(:each) do
      @black_card = BlackCard.create!(:text => "test black", :blanks => 1)
      @other_black_card = BlackCard.create!(:text => "test other black", :blanks => 1)
      @white_card = WhiteCard.create!(:text => "test white")
      @entry = Entry.create!(:white_card => @white_card, :black_card => @black_card)
      @entry2 = Entry.create!(:white_card => @white_card, :black_card => @black_card)
      @entry3 = Entry.create!(:white_card => @white_card, :black_card => @other_black_card)
    end

    it "should return 2 entries with the same black cards" do
      game = Entry.easy_game
      game.sort.should eql([@entry, @entry2])
      game.should_not include(@entry3)
    end
  end
end
