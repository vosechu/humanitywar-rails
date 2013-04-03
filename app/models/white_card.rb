class WhiteCard < ActiveRecord::Base
  attr_accessible :text
  has_many :entries_white_cards

  def to_s
    self.text
  end
end