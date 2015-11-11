require 'rails_helper'

describe TopicsController do


  describe "#index" do
    it "renders the index page" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns an instance variable to all posts" do
      get :index
      expect(assigns(:topics)).to eq Topic.all
    end
  end

  describe "#show" do
    it "renders the show page form" do
      new_topic = FactoryGirl.create(:topic)
      get :show, id: new_topic
      expect(response).to render_template(:show)
    end

    it "assigns an instance variable to all posts" do
      new_topic = FactoryGirl.create(:topic)
      get :show, id: new_topic
      expect(assigns(:topic)).to eq Topic.includes(:conversations).find(new_topic.id)
    end
  end


end
