class MessagesController < ApplicationController

  # def new
  #   render
  # end

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


  def destroy
  end

    private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, conversation_id: @conversation.id)
  end
end
