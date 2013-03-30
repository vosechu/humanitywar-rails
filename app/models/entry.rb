class Entry < ActiveRecord::Base
  belongs_to :playa
  has_and_belongs_to_many :white_cards
  belongs_to :black_card
  attr_accessible :draws, :loses, :wins, :white_card_ids, :black_card_id, :playa_id

  default_scope includes(:black_card, :white_cards, :playa)

  scope :game, order("random()").limit(2)
  scope :winningest, order("wins DESC")
  scope :losingest, order("loses DESC")
  scope :newest, order("created_at DESC")

  validates :white_cards, :black_card, :playa, :presence => true
  validate :white_cards_correct_length

  def self.easy_game
    b = BlackCard.used.sample
    g = self.game.where(:black_card_id => b.id)
    return g if g.length > 1
    return self.easy_game # Evil recursion
  end

  self.per_page = 10

  def white_cards_correct_length
    if self.black_card.blanks.to_i != self.white_cards.length
      errors.add(:white_cards, "has to match the number of blanks on the black card")
    end
  end

end
