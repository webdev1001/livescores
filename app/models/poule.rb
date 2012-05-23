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
end