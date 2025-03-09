class Chats::Message < ApplicationRecord
  self.table_name_prefix = "chats_"
  belongs_to :chat
  
  after_create :perform_ai_response, if: -> {data["role"] == "user" || data["role"] == "tool"}
  after_create_commit :perform_tool_response, if: -> {data["tool_calls"].present?}
  after_create_commit :broadcast_message
  
  def perform_tool_response
    tool_response_message = chat.messages.new(
      data: {
        role: "tool",
        name: data["tool_calls"].first["function"]["name"],
        tool_call_id: data["tool_calls"].first["id"],
      }
    )

    case data["tool_calls"].first["function"]["name"]
    when "dad_joke"
      tool_response_message.data["content"] = get_random_dad_joke
    end
    
    tool_response_message.save!
  end

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

  def get_random_dad_joke
    response = HTTParty.get(
      "https://icanhazdadjoke.com/",
      headers: {
        "Accept" => "application/json",
        "User-Agent" => "My Rails App (https://example.com)"
      }
    )
    JSON.parse(response.body)["joke"]
  end
end
