class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :check_login
  # authorize_resource

  def index
    # finding all the active owners and paginating that list (will_paginate)
    @users = User.all.paginate(page: params[:page]).per_page(15)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_url
    else
      render action: 'new'
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to users_url
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

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :active, :role, :password, :password_confirmation, :email, :phone, :street_1, :street_2, :city, :state, :zip)
    end
end
