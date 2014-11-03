class SessionsController < ApplicationController
  def create
    omniauth = request.env['omniauth.auth']
    logger.debug("DEBUG info: --#{omniauth.to_xml}--")

    ai = Hash.new # auth info
    ai[:name] = omniauth['info']['name']
    ai[:mail] = omniauth['info']['email']
    ai[:omniauth] = omniauth

    render :xml => ai.to_xml
    ## sample block below
    # unless @user = User.find_by_mail(ai[:mail])
    #   @user = User.create(mail: ai[:mail], name: ai[:name])
    #   flash[:notice] = "New user for #{@user.mail} registered!"
    # else
    #   flash[:notice] = "welcome #{@user.name}!"
    # end
    # session[:user] = @user.id
    # session[:name] = @user.name
    # session[:mail] = @user.mail
    #
    # logger.debug("DEBUG cookie_origin: #{cookies[:siso_oauth_origin]}")
    # next_path = cookies[:siso_oauth_origin] || root_path
    # cookies.delete :siso_oauth_origin
    # redirect_to next_path
  end

  def failure
    flash[:error] = request.parameters['message']
    redirect_to root_path
  end

  def signout
    if current_user
      session[:user] = nil
      session.delete :user
      flash[:notice] = 'successfully signed out!'
    end
    redirect_to root_path
  end
end
# vim: set ts=2 sw=2 expandtab:
