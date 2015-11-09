class SessionsController < ApplicationController
 def create
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to root_url
  else
    render :new
  end
end

  def destroy
  session.clear
  redirect_to root_path
  end
end
