class BlackCard < ActiveRecord::Base
  attr_accessible :blanks, :text
  has_many :entries

  scope :random, order("random()").limit(1)

  def to_s
    self.text
  end
end
