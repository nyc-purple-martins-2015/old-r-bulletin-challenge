class Api::TopicsController < Api::ApiController

  def index
    render json: Topic.includes(:category)
      .order('categories.display_order, topics.name')
      .to_json(include: [:category])
  end

  def show
    topic = Topic.find(params[:id])
    render json: topic.to_json(include: [:recent_conversations])
  end
end