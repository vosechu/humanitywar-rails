class Entry < ActiveRecord::Base
  belongs_to :playa
  has_and_belongs_to_many :white_cards
  belongs_to :black_card
  attr_accessible :draws, :loses, :wins

  default_scope includes(:black_card, :white_cards, :playa)

  scope :not_multi, where("black_cards.blanks = 1")
  scope :game, not_multi.order("random()").limit(2)
  scope :winningest, order("wins DESC")
  scope :losingest, order("loses DESC")
  scope :newest, order("created_at DESC")

  def self.easy_game
    b = BlackCard.used.sample
    g = self.game.where(:black_card_id => b.id)
    return g if g.length > 1
    return self.easy_game
  end

  self.per_page = 10

end
