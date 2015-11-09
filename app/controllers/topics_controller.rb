class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @conversations = Conversation.where(topic: params[:id])
  end

end
