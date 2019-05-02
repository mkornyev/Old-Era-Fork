class ReEntrantsController < ApplicationController
  before_action :set_re_entrant, only: [:show, :edit, :update, :destroy]

  # GET /re_entrants
  # GET /re_entrants.json
  def index
    if params[:re_entrant]
      @re_entrants = ReEntrant.for_neighborhood(params[:re_entrant][:for_neighborhood]).paginate(:page => params[:page]).per_page(10)
    else
      @re_entrants = ReEntrant.all.paginate(:page => params[:page]).per_page(10)
    end
  end

  # GET /re_entrants/1
  # GET /re_entrants/1.json
  def show
    @transactions = @re_entrant.transactions
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
    @user = User.new(user_params)
    @user.role = "reentrant"
    @re_entrant = ReEntrant.new
    @re_entrant.neighborhood = params[:re_entrant][:neighborhood]
    

    respond_to do |format|
      if @user.save
        @re_entrant.user_id = @user.id
        if @re_entrant.save
          session[:user_id] = @re_entrant.user.id
          logger.info("Saving is good!")
          format.html { redirect_to @re_entrant, notice: 'Your account was successfully created!' }
          format.json { render :show, status: :created, location: @re_entrant }
        else
          render action: 'new'
        end
      else
        # @user.valid?
        format.html { render :new, notice: 'Unable to save user' }
        format.json { render json: @re_entrant.errors, status: :unprocessable_entity }
        # render action: 'new'
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

  def referrals
    @current = Transaction.for_re_entrant(current_user.reentrant.id).where("resource_accessed = ?", false)
    @past = Transaction.for_re_entrant(current_user.reentrant.id).where("resource_accessed = ?", true)
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
      params.require(:re_entrant).permit(:first_name, :last_name, :active, :email, :phone, :username, :password, :password_confirmation, :neighborhood, :user_id, :for_neighborhood)
    end

    def user_params
      params.require(:re_entrant).permit(:first_name, :last_name, :active, :email, :phone, :username, :password, :password_confirmation)
    end
end
