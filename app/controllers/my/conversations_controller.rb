class My::ConversationsController < ApplicationController
  def index
    @conversations = current_user.conversations
  end
end
