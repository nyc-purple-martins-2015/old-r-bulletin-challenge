class UsersController < ApplicationController
  def index
  end

  def show
    if logged_in?
      @user = current_user
      @conversations = @user.conversations
      @messages = @user.messages
    else
      redirect_to login_path
    end
  end

  def create
    user_params = params.require(:user).permit(:username, :email, :password)
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to categories_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
