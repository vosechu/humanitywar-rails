class Playa < ActiveRecord::Base
  attr_accessible :user
  has_many :entries

  def to_s
    self.user
  end
end
