class SessionsController < ApplicationController

  def new
  end

  def create
    session[:current_user] = @user
    redirect_to "/"
  end

  def destroy
    session.clear
  end

end
