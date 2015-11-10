class ConversationsController < ApplicationController

	def show
		@conversation = Conversation.find(params[:id])
		@message = Message.new
		@message.conversation = @conversation
	end
end
