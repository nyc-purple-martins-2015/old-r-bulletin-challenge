class TopicsController < ApplicationController
  def index
  end

  def show
    @topic = Topic.find(params[:id])
    @conversations = Conversation.where(topic_id: @topic.id)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
