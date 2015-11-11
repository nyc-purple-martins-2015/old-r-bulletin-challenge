class Topic < ActiveRecord::Base
  RECENT_CONVERSATION_COUNT = 5

  belongs_to :category
  has_many :conversations

  def recent_conversations
    conversations.order(created_at: :desc).limit(RECENT_CONVERSATION_COUNT)
  end

end
