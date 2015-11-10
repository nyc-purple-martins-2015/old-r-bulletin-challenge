class ConversationsController < ApplicationController
  def index

  end

  def show
    @message = Message.new
    @conversation = Conversation.find(params[:id])
  end

  def active
    @messages = Message.order(created_at: :desc).limit(5)
  end

end

