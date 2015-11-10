class UsersController < ApplicationController

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  if @user.save
    session[:user_id] = @user.id
    redirect_to topics_path
  else
    flash[:notice] = @user.errors.full_messages
    redirect_to new_user_path
  end
end

private

def user_params
  params.require(:user).permit(:username, :email, :password)
end

end
