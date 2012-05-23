class Tournament < ActiveRecord::Base
  attr_accessible :name
  
  has_many :poules
  has_many :games, :through => :poules
end
