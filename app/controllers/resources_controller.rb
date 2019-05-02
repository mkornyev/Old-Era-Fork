class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy, :deactivate, :reactivate]
  before_action :check_login
  authorize_resource

  # GET /resources
  # GET /resources.json
  def index
    if current_user.role?(:admin)
      if params[:search]
        @resources = Resource.search(params[:search]).paginate(:page => params[:page]).per_page(10)
      elsif params[:resource]
        @resources = Resource.tagged_with(params[:resource][:tagged_with]).paginate(:page => params[:page]).per_page(10)
      else
        @resources = Resource.all.paginate(:page => params[:page]).per_page(10)
      end
    else
      if params[:search]
        @resources = Resource.search(params[:search]).active.paginate(:page => params[:page]).per_page(10)
      elsif params[:resource]
        @resources = Resource.tagged_with(params[:resource][:tagged_with]).active.paginate(:page => params[:page]).per_page(10)
      else
        @resources = Resource.active.paginate(:page => params[:page]).per_page(10)
      end
    end
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @resource = Resource.find(params[:id])
    @tags = Tagging.for_resource(params[:id])
    if current_user.role?(:reentrant)
      @referred = @resource.referred?(current_user.reentrant)
    else
      @referred = false
    end
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(resource_params)
    @resource.active = true

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def deactivate
    respond_to do |format|
      @resource.update(active: false)
      format.html { redirect_to resources_url, notice: 'Resource was successfully deactivated.' }
      format.json { head :no_content }
    end

  end

  def reactivate
    respond_to do |format|
      @resource.update(active: true)
      format.html { redirect_to resources_url, notice: 'Resource was successfully reactivated.' }
      format.json { head :no_content }
    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
        params.require(:resource).permit(:name, :startDate, :endDate, :phone, :email, :street_1, :street_2, :city, :state, :zip, :image, :desc, :webpage, :search, :tags, :flags, :tagged_with, :tag_ids => [])
    end
end
