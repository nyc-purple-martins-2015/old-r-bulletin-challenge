class MessagesController < ApplicationController
  def create
    message = Conversation.find(params[:conversation_id]).messages.build(message_params)
    if message.save
      flash[:notice] = "Message created"
    else
      flash[:alert] = "Error creating message"
    end
    redirect_to topics_path
  end

  private

    def message_params
      params.require(:message).permit(:content)
    end
end
