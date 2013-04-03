class EntriesWhiteCard < ActiveRecord::Base
  belongs_to :white_card
  belongs_to :entry
  attr_accessible :order, :white_card_id

  default_scope order("`order` ASC")
end
