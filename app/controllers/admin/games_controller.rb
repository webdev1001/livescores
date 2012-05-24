class Admin::GamesController < Admin::AdminController
  def index
  end

  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.js   { 
          render "admin/games/updated"
        }
      else
        format.html { render action: "edit" }
      end
    end
  end
end
