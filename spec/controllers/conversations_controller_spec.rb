require 'rails_helper'
RSpec.describe ConversationsController do
  before(:each) do
    @convo = FactoryGirl.create(:conversation)
    @topic = FactoryGirl.create(:topic)
    user = FactoryGirl.create(:user)
    stub_current_user(user)
  end
  context '#create' do
    it 'creates a conversation with valid params' do
      expect{
        post :create, topic_id: @topic.id, conversation: FactoryGirl.attributes_for(:conversation)
      }.to change{Conversation.count}.by (1)
    end
    it  'does not create a new conversation with invalid params' do
            expect{
        post :create, topic_id: @topic.id, conversation: FactoryGirl.attributes_for(:user)
      }.to_not change{Conversation.count}
    end
  end
end
