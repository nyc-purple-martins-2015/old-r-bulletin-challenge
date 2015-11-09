class ConversationsController < ApplicationController

  def new
    @topic = Topic.find(params[:topic_id])
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @topic = Topic.find(params[:topic_id])

    if @conversation.save
      puts "XXXXXXXXXXXXXXXX"
      redirect_to topic_conversation_path(@topic, @conversation)
    else
      redirect_to new_topic_conversation_path(@topic)
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
  end

  private

  def conversation_params
    params.require(:conversation).permit(:name).merge(topic_id: params[:topic_id], user_id: params[:user_id])
  end
end

