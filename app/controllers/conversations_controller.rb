class ConversationsController < ApplicationController
  def index
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = Message.where(conversation_id: @conversation.id)
  end

  def new

  end

  def create
    @topic = Topic.find(params[:topic_id])
    convo_params = params.require(:conversation).permit(:name).merge(user_id: current_user.id, topic_id: @topic.id)
    @conversation = Conversation.new(convo_params)
    if @conversation.save
      redirect_to @topic
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
