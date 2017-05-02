class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  
  def new
  end

  def create
    user = User.from_omniauth(auth: env["omniauth.auth"])
    session[:user_id] = user.id  
    redirect_to games_url, notice: "Signed In!"
  end

  def destory
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed Out!"
  end

  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
end
