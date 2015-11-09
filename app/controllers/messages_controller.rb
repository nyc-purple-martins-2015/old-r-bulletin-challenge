class MessagesController < ApplicationController
  def index
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    if logged_in?
      @conversation = Conversation.find(params[:conversation_id])
      @message = Message.new
    else
     redirect_to login_path
    end
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    message_params = params.require(:message).permit(:content).merge(user_id: current_user.id)
    @message = @conversation.messages.new(message_params)
    if @message.save
      render partial:"messages/show", layout: false, locals:{message: @message}
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
