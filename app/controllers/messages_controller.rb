class MessagesController < ApplicationController

  def index
    @messages = Message.where(conversation: params[:conversation_id])
    @conversation = Conversation.find(params[:conversation_id])
  end

end
