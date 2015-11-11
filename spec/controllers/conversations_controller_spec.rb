require 'rails_helper'

describe TopicsController do

  before(:each) do
    @topic = FactoryGirl.create(:topic)
    @conversation = FactoryGirl.create(:conversation)
  end

  describe "conversation page" do
    it "#index" do
      get :index
      conversation = FactoryGirl.create(:conversation)
      # expect(assigns(:topic)).to eq Topic.find(@topic.id)
      expect(conversation.name).to eq "Best song about Angelita?"
    end

    # THIS IS ON ICE
    # it "#show" do
    #   get :show
    #   visit conversation_path(@conversation)
    #   open_and_save_page
    #   expect(page).to have_content("Folk Songs")
    # end

  end

end
