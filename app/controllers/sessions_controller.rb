class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      puts "Logged in"
      redirect_to resources_path, notice: "Logged in!"
    else
      puts "Cant log in"
      flash.now.alert = "Username and/or password is invalid"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to index_path, notice: "Logged out!"
  end
end