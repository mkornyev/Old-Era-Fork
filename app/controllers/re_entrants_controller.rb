class ReEntrantsController < ApplicationController
  before_action :set_re_entrant, only: [:show, :edit, :update, :destroy]

  # GET /re_entrants
  # GET /re_entrants.json
  def index
    @re_entrants = ReEntrant.all
  end

  # GET /re_entrants/1
  # GET /re_entrants/1.json
  def show
  end

  # GET /re_entrants/new
  def new
    @re_entrant = ReEntrant.new
  end

  # GET /re_entrants/1/edit
  def edit
  end

  # POST /re_entrants
  # POST /re_entrants.json
  def create
    @re_entrant = ReEntrant.new(re_entrant_params)

    respond_to do |format|
      if @re_entrant.save
        format.html { redirect_to @re_entrant, notice: 'Re entrant was successfully created.' }
        format.json { render :show, status: :created, location: @re_entrant }
      else
        format.html { render :new }
        format.json { render json: @re_entrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /re_entrants/1
  # PATCH/PUT /re_entrants/1.json
  def update
    respond_to do |format|
      if @re_entrant.update(re_entrant_params)
        format.html { redirect_to @re_entrant, notice: 'Re entrant was successfully updated.' }
        format.json { render :show, status: :ok, location: @re_entrant }
      else
        format.html { render :edit }
        format.json { render json: @re_entrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /re_entrants/1
  # DELETE /re_entrants/1.json
  def destroy
    @re_entrant.destroy
    respond_to do |format|
      format.html { redirect_to re_entrants_url, notice: 'Re entrant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_re_entrant
      @re_entrant = ReEntrant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def re_entrant_params
      params.require(:re_entrant).permit(:neighborhood, :user_id)
    end
end
