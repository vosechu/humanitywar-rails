class Entry < ActiveRecord::Base
  belongs_to :playa
  belongs_to :white_card
  belongs_to :black_card
  attr_accessible :draws, :loses, :wins

  default_scope includes(:black_card, :white_card, :playa)

  scope :game, order("random()").limit(2)
  scope :not_multi, where("black_cards.blanks = 1")

  def self.easy_game
    b = BlackCard.random.first
    self.not_multi.game.where(:black_card_id => b.id)
  end
end
