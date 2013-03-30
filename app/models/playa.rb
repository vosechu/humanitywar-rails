class Playa < ActiveRecord::Base
  attr_accessible :email
  has_many :entries

  def to_s
    self.email
  end
end
