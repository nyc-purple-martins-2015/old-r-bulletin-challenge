class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new

  end

  def show
    @topic = Topic.find(params[:id])
    @conversations = @topic.conversations
  end
end
