class MessagesController < ApplicationController

  def index
    @messages = Message.where(conversation: params[:conversation_id])
    @conversation = Conversation.find(params[:conversation_id])
  end

  def new
  	if logged_in?
  		@message = Message.new 
  		@conversation = Conversation.find(params[:conversation_id])
  	else 
  		redirect_to login_path
  	end 
  end 

end
