require 'spec_helper'
require 'rails_helper'

describe My::ConversationsController, type: :controller do
  let(:user) { FactoryGirl.create :user}

  before(:each) do
    # stub_authorize_user!
    stub_current_user(user)
  end

  it 'expects @conversation to be assigned to the current users conversations' do
    get :index
    expect(assigns(:conversations)).to eq user.conversations
  end
end
