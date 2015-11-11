require 'rails_helper'
RSpec.describe SessionsController do
  context '#create' do
  before(:each) do
    session.clear
  end
    it 'logs in a user' do
      joe = FactoryGirl.create(:user, password: "12345")
      user_hash = {user: {username: joe.username}, password: "12345"}
      p joe
      post :create, user_hash
      expect(session[:user_id]).to eq joe.id
    end
    it 'does not log in a user with invalid params' do
      joe = FactoryGirl.create(:user, password: "12345")
      user_hash = {user: {username: joe.username}, password: "asdkfjghsdlfjghsad"}
      post :create, user_hash
      expect(session[:user_id]).to be nil
    end
  end
end
