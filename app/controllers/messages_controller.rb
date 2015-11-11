class MessagesController < ApplicationController
  def create
    conversation = Conversation.find(params[:conversation_id])
    message = conversation.messages.build(message_params.merge(user_id: current_user.id))
    if message.save
      flash[:notice] = "Message created"
    else
      flash[:alert] = "Error creating message"
    end
    redirect_to [conversation.topic, conversation]
  end

  private

    def message_params
      params.require(:message).permit(:content)
    end
end
