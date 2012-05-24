class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_tournament
  
  def current_tournament
    @current_tournament = Tournament.find_by_subdomain(request.subdomain)
  end
end
