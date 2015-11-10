class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.includes(:messages).find(params[:id])
  end
end
