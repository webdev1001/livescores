class Admin::TournamentsController < Admin::AdminController

  def index
    @tournaments = Tournament.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tournaments }
    end
  end

  def show
    @tournament = current_tournament

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tournament }
    end
  end

  def new
    @tournament = Tournament.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tournament }
    end
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def create
    @tournament = Tournament.new(params[:tournament])

    respond_to do |format|
      if @tournament.save
        format.html { redirect_to admin_tournament_path(@tournament), notice: 'Tournament was successfully created.' }
        format.json { render json: @tournament, status: :created, location: @tournament }
      else
        format.html { render action: "new" }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @tournament = Tournament.find(params[:id])

    respond_to do |format|
      if @tournament.update_attributes(params[:tournament])
        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def generate_schedule
    tournament = Tournament.find(params[:id])
    
    tournament.poules.each do |poule|
      poule.games.delete_all
      poule.schedule.gamedays.each do |gameday|
        gameday.games.each do |match|
          Game.create!(:home_id => match.team_a, :away_id => match.team_b, :poule_id => poule.id)
        end
      end
    end
    
    redirect_to schedule_admin_tournament_path(@tournament), notice: 'Toernooischema gegenereerd.'
  end

  def destroy
    @tournament = Tournament.find(params[:id])
    @tournament.destroy

    respond_to do |format|
      format.html { redirect_to tournaments_url }
      format.json { head :no_content }
    end
  end
  
  def schedule
    @page = 'schedule'
    @tournament = current_tournament
  end
  
  def games
    @page = 'games'    
    @tournament = current_tournament
  end
end