class MessagesController < ApplicationController

  def new
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.create(content: params[:message][:content], user_id: current_user.id)
    @topic = Topic.find(@conversation.topic_id)
    redirect_to topic_conversation_path(@topic, @conversation)
  end
end
