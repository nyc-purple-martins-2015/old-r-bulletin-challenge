class MessagesController < ApplicationController

  def new
    @conversation_id = params[:conversation][:id]
    @message = Message.new
  end

  def create
    @conversation = Conversation.find(params[:message][:conversation_id])

    @message = Message.new(message_params)
    if @message.save
      redirect_to topic_conversation_path(@conversation.topic_id, @conversation.id)
    else
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :conversation_id, :user_id)
  end
end
