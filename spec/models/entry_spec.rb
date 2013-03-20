require 'spec_helper'

describe Entry do
  context "game scope" do
    before(:each) do
      @black_card = BlackCard.create!(:text => "test black", :blanks => 1)
      @playa = Playa.create!(:user => "Al")
      # @white_card = WhiteCard.create!(:text => "test white")

      @entry = Entry.create()
      @entry.playa = @playa
      @entry.black_card = @black_card
      @entry.black_card.blanks.times do
        @entry.white_cards << WhiteCard.create!(:text => "white card 1")
      end
      @entry.save

      @entry2 = Entry.create()
      @entry2.playa = @playa
      @entry2.black_card = @black_card
      @entry2.black_card.blanks.times do
        @entry2.white_cards << WhiteCard.create!(:text => "white card 2")
      end
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
      @playa = Playa.create!(:user => "Al")

      @entry_1_blank = Entry.create()
      @entry_1_blank.playa = @playa
      @entry_1_blank.black_card = @black_card_1_blank
      @entry_1_blank.black_card.blanks.times do
        @entry_1_blank.white_cards << WhiteCard.create!(:text => "white card 1")
      end
      @entry_1_blank.save

      @entry_2_blanks = Entry.create()
      @entry_2_blanks.playa = @playa
      @entry_2_blanks.black_card = @black_card_2_blanks
      @entry_2_blanks.black_card.blanks.times do
        @entry_2_blanks.white_cards << WhiteCard.create!(:text => "white card 2")
      end
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
      @white_cards = WhiteCard.create!(:text => "test white")
      @playa = Playa.create!(:user => "Al")

      @entry = Entry.create()
      @entry.playa = @playa
      @entry.black_card = @black_card
      @entry.black_card.blanks.times do
        @entry.white_cards << @white_cards
      end
      @entry.save

      @entry2 = Entry.create()
      @entry2.playa = @playa
      @entry2.black_card = @black_card
      @entry2.black_card.blanks.times do
        @entry2.white_cards << @white_cards
      end
      @entry2.save

      @entry3 = Entry.create()
      @entry3.playa = @playa
      @entry3.black_card = @other_black_card
      @entry3.black_card.blanks.times do
        @entry3.white_cards << @white_cards
      end
      @entry3.save
    end

    it "should return 2 entries with the same black cards" do
      game = Entry.easy_game
      game.sort.should eql([@entry, @entry2])
      game.should_not include(@entry3)
    end
  end
end
