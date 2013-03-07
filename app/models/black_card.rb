class BlackCard < ActiveRecord::Base
  attr_accessible :blanks, :text
  has_many :entries
end
