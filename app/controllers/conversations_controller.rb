class ConversationsController < ApplicationController

  def index
  end

  def show
    @conversations = Conversation.where(topic: params[:id] )
  end

end
