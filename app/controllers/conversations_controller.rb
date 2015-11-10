class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.includes(:messages).find(params[:id])
  end

  def index
    @topic = Topic.find(params[:topic_id])
    @conversations = @topic.recent_conversations
  end
end
