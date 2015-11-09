class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    @topic = Topic.find(@conversation.topic_id)
  end
end
