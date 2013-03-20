class WhiteCard < ActiveRecord::Base
  attr_accessible :text
  has_and_belongs_to_many :entries

  def to_s
    self.text
  end
end