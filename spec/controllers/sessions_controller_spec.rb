require 'rails_helper'

describe SessionsController do
  context "new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  context "#create" do
    let(:user) { FactoryGirl.create :user, password:'hello' }

    it "redirects to topics path if correct credentials" do
      params_hash = { user:{username: user.username}, password:'hello' }
      post :create, params_hash
      expect(response).to redirect_to topics_path
    end

    it "redirects to topics path with bad password" do
      params_hash = { user:{username: user.username}, password: nil }
      post :create, params_hash
      expect(response).to redirect_to topics_path
    end
  end
end