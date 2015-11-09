class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @conversations = @topic.conversations
    # @messages = @conversations.messages
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def create
    topic_params = params.require(:topic).permit(:name)
    topic = Topic.new(topic_params)
    if topic.save
      redirect_to topic
    else
      render :new
    end
  end

  def delete
  end

  def update
    topic_params = params.require(:topic).permit(:name)
    topic = Topic.find(params[:id])
    if topic.update_attributes(topic_params)
      redirect_to topic
    else
      render :edit
    end
  end
end
