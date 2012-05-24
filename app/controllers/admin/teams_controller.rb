class Admin::TeamsController < Admin::AdminController

  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
        format.js   { 
          @tournament = @team.poule.tournament
          render "admin/tournaments/update_poules"
        }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end
end
