require 'rails_helper'

describe UsersController do


  describe "#new" do
    it "renders the new user form" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns a new empty user" do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
  end

  describe "#create" do
    it "assigns and saves a new user" do
      expect{post :create, user: FactoryGirl.attributes_for(:user)}.to change(User, :count).by(1)
    end

    it "redirects to index on successful sign up" do
      expect(post :create, user: FactoryGirl.attributes_for(:user)).to redirect_to "/topics"
    end
  end

end
