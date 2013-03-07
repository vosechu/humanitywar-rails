class Playa < ActiveRecord::Base
  attr_accessible :email
  has_many :entries
end
