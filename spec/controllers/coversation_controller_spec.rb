require 'rails_helper'

describe ConversationsController do
  describe "admin panel" do
    describe "#show" do
      it "renders the show page form" do
        new_conversation = FactoryGirl.create(:conversation)
        get :show, topic_id: new_conversation.topic_id, id: new_conversation
        expect(response).to render_template(:show)
      end

      it "assigns an instance variable to the conversation on present page" do
        new_conversation = FactoryGirl.create(:conversation)
        get :show, topic_id: new_conversation.topic_id, id: new_conversation
        expect(assigns(:conversation)).to eq(new_conversation)
      end
    end
  end
end