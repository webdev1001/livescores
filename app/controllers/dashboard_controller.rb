class DashboardController < ApplicationController
  
  def index
    @games = current_tournament.games.recent
  end

end
