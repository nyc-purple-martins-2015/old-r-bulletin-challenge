require 'rails_helper'

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
  context "#create" do 
    it "saves a new instance of the User class with the correct params" do 
      expect { 
        post :create, user: { 
          username: 'maecapozzi', 
          email: 'maecapozzi@example.com',
          password: 'password' 
        }
      }.to change { User.count }.by(1)
    end
    it "does not save a new instance if the params are incorrect" do 
      expect { 
        post :create, user: { 
          username: "", 
          email: "",
          password: "" 
        }
      }.to_not change { User.count }
    end  
  end 
end 
