class TopicsController < ApplicationController
  def index
    @categories = Category.all
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
  end

  def create
  end
end
