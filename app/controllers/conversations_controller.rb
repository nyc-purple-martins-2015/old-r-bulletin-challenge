class ConversationsController < ApplicationController
  def index
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = Message.where(conversation_id: @conversation.id)
    @message = Message.new
  end

  def new

  end

  def create
    @topic = Topic.find(params[:topic_id])
    convo_params = params.require(:conversation).permit(:name).merge(user_id: current_user.id, topic_id: @topic.id)
    @conversation = Conversation.new(convo_params)
    if @conversation.save
      render partial: "conversations/conversation_list_item", layout: false, locals:{convo: @conversation}
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
