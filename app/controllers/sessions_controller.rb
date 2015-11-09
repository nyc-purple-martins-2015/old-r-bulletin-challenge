class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to categories_path
    else
      render :new
    end
  end


  def destroy
    session.clear
    redirect_to categories_path
  end


end
