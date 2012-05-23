class Team < ActiveRecord::Base
  attr_accessible :name, :poule_id
  
  belongs_to :poule
end
