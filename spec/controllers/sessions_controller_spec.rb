require 'rails_helper'

describe SessionsController do

  context "new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  context "#create" do
    let(:user) { FactoryGirl.create :user, password:'catty' }

    it "redirects to topics path if correct credentials" do
      params_hash = { user:{username: user.username}, password:'catty' }
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
