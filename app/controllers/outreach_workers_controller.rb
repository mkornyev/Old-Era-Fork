class OutreachWorkersController < ApplicationController
  before_action :set_outreach_worker, only: [:show, :edit, :update, :destroy, :deactivate, :reactivate]

  # GET /outreach_workers
  # GET /outreach_workers.json
  def index
    @outreach_workers = OutreachWorker.alphabetical.paginate(:page => params[:page]).per_page(20)
  end

  # GET /outreach_workers/1
  # GET /outreach_workers/1.json
  def show
    @transactions = @outreach_worker.transactions.paginate(:page => params[:page]).per_page(10)
  end

  # GET /outreach_workers/new
  def new
    @outreach_worker = OutreachWorker.new
  end

  # GET /outreach_workers/1/edit
  def edit
  end

  # POST /outreach_workers
  # POST /outreach_workers.json
  def create
    @user = User.new(user_params)
    @user.role = "sow"
    @outreach_worker = OutreachWorker.new
    @outreach_worker.organization = params[:outreach_worker][:organization]
    

    respond_to do |format|
      if @user.save
        @outreach_worker.user_id = @user.id
        if @outreach_worker.save
          logger.info("Saving is good!")
          format.html { redirect_to @outreach_worker, notice: 'Outreach Worker was successfully created.' }
          format.json { render :show, status: :created, location: @outreach_worker }
        else
          format.html { render :index }
          format.json { render json: @outreach_worker.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :show }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outreach_workers/1
  # PATCH/PUT /outreach_workers/1.json
  def update
    respond_to do |format|
      if @outreach_worker.update(outreach_worker_params)
        format.html { redirect_to @outreach_worker, notice: 'Outreach worker was successfully updated.' }
        format.json { render :show, status: :ok, location: @outreach_worker }
      else
        format.html { render :edit }
        format.json { render json: @outreach_worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /outreach_workers/referred_users
  def referred
    @users = ReEntrant.for_sow(current_user.outreachWorker.id)
  end

  # GET /outreach_workers/referrals
  def referrals
    @transactions = Transaction.for_outreach_worker(current_user.outreachWorker.id).by_recent.paginate(:page => params[:page]).per_page(10)
  end

  # DELETE /outreach_workers/1
  # DELETE /outreach_workers/1.json
  def destroy
    @outreach_worker.destroy
    respond_to do |format|
      format.html { redirect_to outreach_workers_url, notice: 'Outreach worker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   def deactivate
    respond_to do |format|
      @outreach_worker.update(active: false)
      format.html { redirect_to outreach_workers_url, notice: 'Street Outreach Worker was successfully deactivated.' }
      format.json { head :no_content }
    end

  end

  def reactivate
    respond_to do |format|
      @outreach_worker.update(active: true)
      format.html { redirect_to @outreach_worker, notice: 'Street Outreach Worker was successfully reactivated.' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outreach_worker
      @outreach_worker = OutreachWorker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outreach_worker_params
      params.require(:outreach_worker).permit(:first_name, :last_name, :active, :email, :phone, :username, :password, :password_confirmation, :organization, :user_id)
    end

    def user_params
      params.require(:outreach_worker).permit(:first_name, :last_name, :active, :email, :phone, :username, :password, :password_confirmation)
    end
end
