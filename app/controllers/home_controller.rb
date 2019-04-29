class HomeController < ApplicationController
  def index
    if params[:tran]
      
    end
    @transactions = Transaction.all
    @reentrants = ReEntrant.all
  end

  def about
  end

  def contact
  end

  def privacy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_params
      params.require(:transaction).permit(:name, :startDate, :endDate, :phone, :email, :street_1, :street_2, :city, :state, :zip, :image, :desc, :webpage, :search, :tags, :flags, :tagged_with, :tag_ids => [])
  end
  
end
