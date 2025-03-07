class Chats::Message < ApplicationRecord
  self.table_name_prefix = "chats_"
  belongs_to :chat
  
  after_create :broadcast_message
  after_create :perform_ai_response, if: -> {data["role"] == "user"}
  

  def perform_ai_response
    chat.perform_chat
  end

  def remove_metadata
    data.except("id", "created_at")
  end

  def broadcast_message
    broadcast_append_to( 
      [chat, "messages"], 
      target: "messages", 
      partial: "chats/messages/message", 
      locals: {message: self},
    )
  end
end
