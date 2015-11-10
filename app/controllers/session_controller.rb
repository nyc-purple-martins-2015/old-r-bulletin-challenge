class SessionController < ApplicationController

def new
end

def create
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to topics_path
  else
    flash[:notice] = "Incorrect username or password"
    redirect_to login_path
  end
end

def destroy
  session.clear
  redirect_to topics_path
end

end
