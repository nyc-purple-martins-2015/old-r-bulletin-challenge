class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}!"
      redirect_to root_path
    else
      flash[:notice] = "Login Failed"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
