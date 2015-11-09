class ConversationsController < ApplicationController
  def index
    conversations = Conversation.all.sort_by &:updated_at
    @recent_conversation = conversations.slice(0..9)
    render :index
  end

  def show
    @conversation = Conversation.find(params[:id])
    render :show
  end
end
