require 'rails_helper'

describe TopicsController do

  before(:each) do
    @topic = FactoryGirl.create(:topic)
  end

  describe "topic page" do
    it "#index" do
      get :index
      expect(assigns(:topics)).to eq Topic.all
    end

    # THIS IS ON ICE
    # it "#show" do
    #   get :show
    #   visit topic_path(@topic)
    #   open_and_save_page
    #   expect(page).to have_content("Folk Songs")
    # end

  end

end
