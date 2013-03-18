class Entry < ActiveRecord::Base
  belongs_to :playa
  belongs_to :white_card
  belongs_to :black_card
  attr_accessible :draws, :loses, :wins, :white_card_id, :black_card_id, :playa_id

  default_scope includes(:black_card, :white_card, :playa)

  scope :not_multi, where("black_cards.blanks = 1")
  scope :game, not_multi.order("random()").limit(2)

  validates :white_card, :black_card, :playa, :presence => true

  def self.easy_game
    b = BlackCard.used.sample
    g = self.game.where(:black_card_id => b.id)
    return g if g.length > 1
    return self.easy_game
  end
end
