class Entry < ActiveRecord::Base
  belongs_to :playa
  belongs_to :white_card
  belongs_to :black_card
  attr_accessible :draws, :loses, :wins

  default_scope includes(:black_card, :white_card, :playa).order("rand()").limit(2)

  scope :not_multi, where("black_cards.blanks = 1")
end
