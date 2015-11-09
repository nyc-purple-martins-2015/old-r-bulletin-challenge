class TopicsController < ApplicationController
  def index
    @categories = Category.all
    render :index
  end
  def show
    @topic = Topic.find(params[:id])
    render :show
  end
end
