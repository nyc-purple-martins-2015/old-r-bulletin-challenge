class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      login(user)
      flash[:notice] =  "Welcome back #{user.username}"
      redirect_to '/'
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to '/'
  end
end
