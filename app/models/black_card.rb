class BlackCard < ActiveRecord::Base
  attr_accessible :blanks, :text
  has_many :entries

  scope :used, joins(:entries)
  scope :random, order("random()")

  def to_s
    self.text
  end
end
