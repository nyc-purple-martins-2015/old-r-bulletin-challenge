class ConversationsController < ApplicationController
  def index
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def delete
  end
end
