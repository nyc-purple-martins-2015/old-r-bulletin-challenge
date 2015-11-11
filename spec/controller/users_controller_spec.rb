require 'spec_helper'

describe UsersController do 
  context "#new" do 
    it "creates a new instance of the User class" do
      get :new
      expect(response).to be_success
    end 

    it "successfully renders the new view" do 
      get :new
      expect(response).to render_template(:new)
    end  

  end 
