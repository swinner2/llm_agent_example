class Message < ApplicationRecord
  acts_as_message
  
  after_create_commit :broadcast_create_message
  after_update_commit :broadcast_update_message
  
  def broadcast_create_message
    broadcast_append_to( 
      [chat, "messages"], 
      target: "messages", 
      partial: "messages/message", 
      locals: {message: self},
    )
  end

  def broadcast_update_message
    broadcast_replace_to( 
      [chat, "messages"], 
      target: "message_#{id}", 
      partial: "messages/message", 
      locals: {message: self},
    )
  end
end