class TransactionsController < ApplicationController

  def index
    #Modify so it returns bookmarks based on specific user
    @transactions = Transaction.all.paginate(page: params[:page]).per_page(15)
  end

  def new
    @transaction = Transaction.new
    @sharer = OutreachWorker.find_by_user_id(current_user.id)
  end

  def edit
  end

  def create
    @transaction = Transaction.new
    @transaction.outreach_worker_id = params[:transaction][:outreach_worker_id]
    @transaction.re_entrant_id = User.find_by_email(params[:transaction][:email]).reentrant.id
    @transaction.resource_id = params[:transaction][:resource_id]
    @transaction.resource_accessed = false
    if @transaction.save
      redirect_to resources_url
    else
      render action: 'new'
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
      params.require(:transaction).permit(:resource_id, :outreach_worker_id, :email)
    end
end
