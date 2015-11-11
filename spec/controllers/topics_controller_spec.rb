require 'rails_helper'

RSpec.describe TopicsController do
  before(:each) do
    @topic = FactoryGirl.create(:topic)
  end
  it '#index' do
    get :index
    expect(assigns(:topics)).to eq Topic.all
  end

  it '#show' do
    get :show, id: @topic
    expect(assigns(:topic)).to eq @topic
  end
end
