class BlackCard < ActiveRecord::Base
  attr_accessible :blanks, :text
  has_many :entries

  def to_s
    self.text
  end
end
