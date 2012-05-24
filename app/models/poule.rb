class Poule < ActiveRecord::Base
  attr_accessible :name, :tournament_id
  
  has_many :teams
  has_many :games
  belongs_to :tournament
  
  validates_associated :tournament
  validates_presence_of :name, :tournament_id
  validates_uniqueness_of :name, :scope => :tournament_id
  
  def schedule
    t = []
    teams.each do |team|
      t << team.id
    end
    
    poule = RRSchedule::Schedule.new(
      :teams => t,
      :rules => [
        RRSchedule::Rule.new(:wday => 6)
      ],
      :start_date => Date.parse("2012/05/10"),
      :shuffle => false
    )
    
    return poule.generate
  end
  
  def ranking
    teams = []
    self.teams.each do |team|
      team.points = team.calulate_points
      teams << team
    end
    teams.sort! { |a,b| b.points <=> a.points }
  end
end