class MessagesController < ApplicationController
	def create
			if logged_in?
				msg = Message.new(msg_params)
				conversation = Conversation.find(msg.conversation_id)
				topic = conversation.topic
				if msg.save
					redirect_to topic_conversation_path(conversation, topic)
				else
					flash[:notice] = "Please enter a comment!"
					redirect_to topic_conversation_path(conversation, topic)
				end
			else
				flash.now[:notice] = "You must be logged in to comment!"
				render :show
		end
	end

	private
  	  def msg_params
        params.require(:message).permit(:content).merge(conversation_id: params[:conversation_id], user_id: current_user.id)
  		
  	end
end