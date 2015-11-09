class ConversationsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @conversation = Conversation.new(convo_params)
    if @conversation.save
      # byebug
      redirect_to @topic
    else
      flash.now[:notice] = "Please make sure all fields are completed."
      render 'new'
    end
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @conversation = Conversation.new
  end

  def edit
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
    render 'show'
  end

  def update
  end

  def destroy
  end

  private

  def convo_params
    params.require(:conversation).permit(:name).merge(user_id: current_user.id, topic_id: @topic.id)
  end


end
