class TopicsController < ApplicationController

	def index
		@topics = Topic.all
	end

	def show
		@topic = Topic.find(params[:id])
		@conversations = @topic.conversations.order(:updated_at)
	end

end
