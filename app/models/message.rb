class Message < ApplicationRecord
  acts_as_message
  
  after_create_commit :broadcast_message
  
  def broadcast_message
    broadcast_append_to( 
      [chat, "messages"], 
      target: "messages", 
      partial: "messages/message", 
      locals: {message: self},
    )
  end
end