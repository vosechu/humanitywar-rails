require 'spec_helper'

describe Entry do
  context "game scope" do
    before(:each) do
      @black_card = BlackCard.create!(:text => "test black", :blanks => 1)
      @white_card = WhiteCard.create!(:text => "test white")
      @entry = Entry.create()
      @entry.white_cards << @white_card
      @entry.black_card = @black_card
      @entry.save
      @entry2 = Entry.create()
      @entry2.white_cards << @white_card
      @entry2.black_card = @black_card
      @entry2.save
    end

    it "should return two entries" do
      Entry.game.length.should eql(2)
    end

    it "should return entry1/2" do
      Entry.game.sort.should eql([@entry, @entry2])
    end
  end

  context "easy_game pseudo-scope" do
    before(:each) do
      @black_card = BlackCard.create!(:text => "test black", :blanks => 1)
      @other_black_card = BlackCard.create!(:text => "test other black", :blanks => 1)
      @white_card = WhiteCard.create!(:text => "test white")
      @entry = Entry.create()
      @entry.white_cards << @white_card
      @entry.black_card = @black_card
      @entry.save
      @entry2 = Entry.create()
      @entry2.white_cards << @white_card
      @entry2.black_card = @black_card
      @entry2.save
      @entry3 = Entry.create()
      @entry3.white_cards << @white_card
      @entry3.black_card = @other_black_card
      @entry3.save
    end

    it "should return 2 entries with the same black cards" do
      game = Entry.easy_game
      game.sort.should eql([@entry, @entry2])
      game.should_not include(@entry3)
    end
  end
end
