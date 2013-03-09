require 'spec_helper'

describe Entry do
  context "game scope" do
    before(:each) do
      @black_card = BlackCard.create!(:text => "test black", :blanks => 1)
      @white_card = WhiteCard.create!(:text => "test white")
      @entry = Entry.create()
      @entry.white_card = @white_card
      @entry.black_card = @black_card
      @entry.save
      @entry2 = Entry.create()
      @entry2.white_card = @white_card
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

  context "not_multi scope" do
    before(:each) do
      @black_card_2_blanks = BlackCard.create!(:text => "test black", :blanks => 2)
      @black_card_1_blank = BlackCard.create!(:text => "test black", :blanks => 1)
      @entry_1_blank = Entry.create()
      @entry_1_blank.white_card = @white_card
      @entry_1_blank.black_card = @black_card_1_blank
      @entry_1_blank.save
      @entry_2_blanks = Entry.create()
      @entry_2_blanks.white_card = @white_card
      @entry_2_blanks.black_card = @black_card_2_blanks
      @entry_2_blanks.save
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
      @entry = Entry.create()
      @entry.white_card = @white_card
      @entry.black_card = @black_card
      @entry.save
      @entry2 = Entry.create()
      @entry2.white_card = @white_card
      @entry2.black_card = @black_card
      @entry2.save
      @entry3 = Entry.create()
      @entry3.white_card = @white_card
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
