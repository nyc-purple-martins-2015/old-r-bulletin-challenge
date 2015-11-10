class MessagesController < ApplicationController
  before_action :all_messages, only: [:create]
  respond_to :html, :js

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    if @message.save
      redirect_to conversation_path(@conversation)
    else
      flash.now[:notice] = "You may not submit an empty message."
      render @conversation
    end
  end

    private

  def all_messages
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages
  end


  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, conversation_id: @conversation.id)
  end
end
