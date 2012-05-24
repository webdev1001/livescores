class TournamentsController < ApplicationController
  
  def show
    @tournament = current_tournament
  end
  
  def ranking
    @tournament = current_tournament
  end
  
  def finals
    @tournament = current_tournament
  end

end
