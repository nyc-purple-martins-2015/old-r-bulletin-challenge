require 'rails_helper'

describe SessionsController do 
  context "#destroy" do 
    before(:each) do 
      get 'destroy', {}, {user_id: 1}
    end 
    it "clears a session" do 
      session[:user_id].should be_nil
    end
  end
  context "#new" do 
    it "creates a new user" do 
      get :new 
      expect(response).to be_success
    end 
  end  
end
      
