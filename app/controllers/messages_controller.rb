class MessagesController < ApplicationController
  def new
    conversation_id = params[:conversation_id]
    @message = Message.new
  end

  def create
    conversation = Conversation.find(params[:conversation_id])
    @message = current_user.messages.new(content: params[:message][:content], conversation_id: conversation.id)
    if @message.save
      redirect_to conversation
    else
      render :new
    end
  end
end
