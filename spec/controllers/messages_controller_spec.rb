require 'rails_helper'

describe MessagesController do
  describe "admin panel" do
    context "#create" do
      it "creates a message with valid params" do
        expect{
          post :create, message: FactoryGirl.attributes_for(:message)
        }.to change(Message, :count).by(1)
      end
      it "doesn't create a message when params are invalid" do
        expect{
          post :create, message: FactoryGirl.attributes_for(:invalid_message)
        }.to_not change(Message, :count)
      end
    end
  end
end