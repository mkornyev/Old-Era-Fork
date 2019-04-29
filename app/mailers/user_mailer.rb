class UserMailer < ApplicationMailer

  def share_resource(user, resource, sow)
    @user = user
    @resource  = resource
    @sow = sow
    mail(to: @user.email, subject: 'You have been referred a resource!')
  end

  def share_resource_externally(email, resource, sow)
    @resource  = params[:resource]
    @sow = params[:sow]
    mail(to: email, subject: 'You have been referred a resource!')
  end




end
