class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.includes(:conversations).find(params[:id])
  end
end
