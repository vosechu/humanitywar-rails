require 'spec_helper'

describe BlackCard do
  context "scope #used" do
    before(:each) do
      @black_card = BlackCard.create!(:text => "test black", :blanks => 1)
      @black_card_not_used = BlackCard.create!(:text => "test black not in an entry", :blanks => 1)
      @white_card = WhiteCard.create!(:text => "test white")
      @entry = Entry.create!(:black_card_id => @black_card.id, :white_card_id => @white_card.id)
    end
  end
end
