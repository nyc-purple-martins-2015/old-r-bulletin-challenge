class MessagesController < ApplicationController

  def new
    @message = Message.new( conversation_id: params[:conversation][:conversation_id])
  end

  def create
    if !logged_in?
      redirect_to '/login'
    end
    params[:message][:user_id]= current_user.id
    message_params = params.require(:message).permit(:content, :user_id, :conversation_id)
    message = Message.new(message_params)
    if logged_in?  && message.save
      flash[:notice] =  "Message saved."
      redirect_to topic_conversation_path(message.conversation_id, Conversation.find(message.conversation_id).topic_id)
    else
      render :new
    end
  end
end
