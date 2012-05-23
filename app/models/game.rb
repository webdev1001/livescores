class Game < ActiveRecord::Base
  attr_accessible :away_id, :away_score, :home_id, :home_score, :poule_id
  
  belongs_to :home_team, :class_name => 'Team', :foreign_key => 'home_id'
  belongs_to :away_team, :class_name => 'Team', :foreign_key => 'away_id'
  belongs_to :poule
  
  validates_presence_of :home_id, :away_id, :poule_id
  validates_uniqueness_of :home_id, :scope => [ :poule_id, :away_id ]
  
  scope :recent, :limit => 10, :order => 'updated_at DESC'
  
  def winner
    if !home_score.nil? and !away_score.nil?      
      if home_score.to_i > away_score.to_i
        return home_id
      elsif home_score.to_i < away_score.to_i
        return away_id
      else
        return 0
      end
    else
      return nil
    end
  end

end
