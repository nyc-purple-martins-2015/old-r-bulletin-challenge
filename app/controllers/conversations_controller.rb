class ConversationsController < ApplicationController

  def index
    @topic = Topic.find(params[:topic_id])
    @conversations = @topic.recent_conversations
  end

  def show
    @conversation = Conversation.includes(:messages).find(params[:id])
  end


  def create
    topic = Topic.find(params[:topic_id])
    conversation = topic.conversations.build(conversation_params.merge(user_id: current_user.id))

    if conversation.save
      flash[:notice] = "Created conversation"
    else
      flash[:warn] = "Ragnarők"
    end
    redirect_to topic
  end

  private

    def conversation_params
      params.require(:conversation).permit(:name)
    end
end
