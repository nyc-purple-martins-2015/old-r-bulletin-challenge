require 'rails_helper'

describe UsersController do
  describe "admin panel" do
    it "#new" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  context "#create" do
    let(:user) { FactoryGirl.create :user, password:'hello' }

    it "creates a users with valid params" do
      expect{
        post :create, user: FactoryGirl.attributes_for(:user)
      }.to change(User, :count).by(1)
    end

    it "redirects to index on successful sign up" do
      expect(post :create, user: FactoryGirl.attributes_for(:user)).to redirect_to "/topics"
    end
  end
end