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

  def self.easy_game
    b = BlackCard.used.sample
    g = self.game.where(:black_card_id => b.id)
    return g if g.length > 1
    return self.easy_game # Evil recursion
  end

  self.per_page = 10

end
