class DashboardController < ApplicationController
  
  def index
    @games = Game.recent
  end

end
