class ConversationsController < ApplicationController

  def show
    @conversation = Conversation.find(params[:id])
    @topic = Topic.find(@conversation.topic_id)
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @conversation = Conversation.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @conversations = @topic.conversations.create(name: params[:conversation][:name], user_id: current_user.id)
    redirect_to topics_path
  end

end
