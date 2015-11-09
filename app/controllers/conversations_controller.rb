class ConversationsController < ApplicationController
  def create
  end

  def new
  end

  def edit
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
  end

  def update
  end

  def destroy
  end
end
