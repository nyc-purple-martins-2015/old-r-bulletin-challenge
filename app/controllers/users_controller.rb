class UsersController < ApplicationController


  def create
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @author_conversations = Conversation.where(author: @user.id)
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password,
                                 :password_confirmation)
  end

end
