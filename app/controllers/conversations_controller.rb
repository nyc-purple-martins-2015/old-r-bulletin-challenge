class ConversationsController < ApplicationController

	def show
		@conversation = Conversation.find(params[:id])
		@message = Message.new
		@message.conversation = @conversation
	end

	def create
		if logged_in?
			conv = Conversation.new(conv_params)
			topic = conv.topic
			if conv.save
				redirect_to topic_path(topic)
			else
				flash[:notice] = "Please enter a topic!"
				redirect_to topic_path(topic)
			end
		else
			flash.now[:notice] = "You must be logged in to create a topic!"
			render :show
		end
	end

private
	def conv_params
		   params.require(:conversation).permit(:name).merge(topic_id: params[:topic_id], user_id: current_user.id)
	end
end
