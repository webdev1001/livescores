class Team < ActiveRecord::Base
  attr_accessible :name, :poule_id
  attr_accessor :points
  
  belongs_to :poule
  has_many :home_games, :class_name => 'Game', :foreign_key => 'home_id'
  has_many :away_games, :class_name => 'Game', :foreign_key => 'away_id'
  
  def calulate_points
    p = 0
    self.games.each do |game|
      if game.winner == self.id
        p = p + 3
      elsif game.winner == 0
        p = p + 1
      end
    end
    return p
  end
  
  def games
     self.home_games + self.away_games
  end
end
