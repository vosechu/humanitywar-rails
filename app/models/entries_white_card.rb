class EntriesWhiteCard < ActiveRecord::Base
  belongs_to :white_card
  belongs_to :entry
  attr_accessible :weight, :white_card_id

  default_scope order(:weight)
end
