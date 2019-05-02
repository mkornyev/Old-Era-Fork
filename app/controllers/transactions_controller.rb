class TransactionsController < ApplicationController

  def index
    #Modify so it returns bookmarks based on specific user
    if params[:transaction]
      @transactions = Transaction.for_neighborhood(params[:transaction][:for_neighborhood]).paginate(:page => params[:page]).per_page(10)
    else
      @transactions = Transaction.all.paginate(:page => params[:page]).per_page(10)
    end
  end

  def new
    @transaction = Transaction.new
    @sharer = OutreachWorker.find_by_user_id(current_user.id)
  end

  def edit
  end

  def create
    @transaction = Transaction.new
    @transaction.resource_id = params[:transaction][:resource_id]
    @user = User.find_by_email(params[:transaction][:email])
    @transaction.outreach_worker_id = params[:transaction][:outreach_worker_id]
    if @user.nil?
      flash[:notice] = "User does not exist in the system."
      redirect_to @transaction.resource
    else
      @transaction.re_entrant_id = @user.reentrant.id
      @transaction.resource_accessed = false
      if @transaction.save
        UserMailer.share_resource(@transaction.re_entrant.user, @transaction.resource, @transaction.outreach_worker).deliver_now
        redirect_to resources_url
      else
        render action: 'new'
      end
    end
  end

  def update
    if @transaction.update_attributes(transaction_params)
      redirect_to resources_url
    else
      render action: 'edit'
    end
  end

  def destroy
    if @user.destroy
    else
      render action: 'show'
    end
  end

  def use_resource
    @transaction = Transaction.find_by_resource_id(params[:id])
    @transaction.resource_accessed = true
    @transaction.dateAccessed = Time.now
    if @transaction.save
      redirect_to re_entrant_url(@transaction.re_entrant)
    else
      redirect_to resources_url(@transaction.resource)
    end
  end

  private

  def transaction_params
      params.require(:transaction).permit(:resource_id, :outreach_worker_id, :email, :for_neighborhood)
    end
end
