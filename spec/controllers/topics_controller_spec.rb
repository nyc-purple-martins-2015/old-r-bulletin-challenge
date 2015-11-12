require 'rails_helper'

describe TopicsController do
  describe "admin panel" do
    it "#index" do
      get :index
      expect(assigns(:topics)).to eq Topic.all
    end
  end
end