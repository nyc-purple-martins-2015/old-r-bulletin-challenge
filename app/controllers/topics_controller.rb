class TopicsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @topic = Topic.find(params[:id])
    @conversations = @topic.conversations.sort {|a, b| b.created_at <=> a.created_at}
  end
end
