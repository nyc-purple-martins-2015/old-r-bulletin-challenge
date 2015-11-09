class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new

  end

  def show
    @topic = Topic.find(params[:id])
    @conversations = @topic.conversations
    @conversations = @conversations.sort {|a,b| b.updated_at <=> a.updated_at}
  end
end
