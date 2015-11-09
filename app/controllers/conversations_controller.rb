class ConversationsController < ApplicationController

	def show
		# byebug
		@conversation = Conversation.find(params[:id])
		# @messages = @conversation.messages
	end
end
