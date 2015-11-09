class ConversationsController < ApplicationController
  def index
    conversations = Conversation.all.sort_by &:updated_at
    @recent_conversation = conversations.slice(0..9)
    render :index
  end

  def show
    @conversation = Conversation.find(params[:id])
    render :show
  end

  def new
    @topics = Topic.all
    @conversation = Conversation.new
  end

  def create
    @conversation = current_user.conversations.new(name: params[:conversation][:name], topic_id: params[:conversation][:topic_id])
    if @conversation.save
      redirect_to @conversation
    else
      flash.now[:notice] = "No Name or Topic"
      render :new
    end
  end
end
