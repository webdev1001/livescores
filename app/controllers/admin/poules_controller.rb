class Admin::PoulesController < Admin::AdminController
  def create
    @poule = Poule.new(params[:poule])

    respond_to do |format|
      if @poule.save
        format.html { redirect_to admin_poule_path(@poule), notice: 'Poule was successfully created.' }
        format.json { render json: @poule, status: :created, location: @poule }
        format.js   { 
          @tournament = @poule.tournament
          render "admin/tournaments/update_poules"
        }
      else
        format.html { render action: "new" }
        format.json { render json: @poule.errors, status: :unprocessable_entity }
      end
    end
  end
end
