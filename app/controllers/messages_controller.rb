class MessagesController < ApplicationController
  def new
    conversation_id = params[:conversation_id]
    @message = Message.new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to @conversation
    else
      flash.now[:notice] = "No Message"
      # render layout: false
      # line 14 does not turn off layout, had to pull out with ajax.
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(conversation_id: @conversation.id)
  end
end
