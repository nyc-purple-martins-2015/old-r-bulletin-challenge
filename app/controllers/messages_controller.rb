class MessagesController < ApplicationController

def new

end

def create
  @message = Message.new(message_params, user_id: current_user.id)
  if @message.save
    redirect_to conversation_path(@message.conversation)
  else
    flash[:notice] = @message.errors.full_messages
    redirect_to  conversation_path(@message.conversation)
  end
end

def message_params
  params.require(:message).permit(:content).merge(conversation_id: @conversation.id)
end

end
