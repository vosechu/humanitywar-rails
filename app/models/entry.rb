class Entry < ActiveRecord::Base
  belongs_to :playa
  belongs_to :white_card
  belongs_to :black_card
  attr_accessible :draws, :loses, :wins
end
