class UserMailer < ApplicationMailer

  def share_resource
    @user = params[:user]
    @resource  = params[:resource]
    @sow = params[:sow]
    mail(to: @user.email, subject: 'You have been referred a resource!')
  end


end
