class WhiteCard < ActiveRecord::Base
  attr_accessible :text
  has_many :entries
end
