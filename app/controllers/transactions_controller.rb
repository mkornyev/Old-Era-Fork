class TransactionsController < ApplicationController

  def index
    #Modify so it returns bookmarks based on specific user
    @transactions = User.all.paginate(page: params[:page]).per_page(15)
  end

  def new
    @transaction = Transaction.new
  end

  def edit
  end

  def create
    @transaction = Transaction.new(transaction_params)
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
end
