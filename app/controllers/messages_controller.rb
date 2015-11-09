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
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(conversation_id: @conversation.id)
  end
end
