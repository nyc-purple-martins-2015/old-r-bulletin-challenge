class ConversationsController < ApplicationController

  def index
    @conversations = Conversation.order(created_at: :desc)
  end

  def show
    @conversation = Conversation.find(params[:id])
  end
end
