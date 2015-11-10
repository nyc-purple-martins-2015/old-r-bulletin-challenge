class My::MessagesController < ApplicationController
  before_action :require_sign_in

  def index
    @messages = current_user.messages.order(created_at: :desc)
  end
end
