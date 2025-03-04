class Chat < ApplicationRecord
  has_many :messages, class_name: "Chats::Message", dependent: :destroy

  def perform_chat
    response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: [{role: "system", content: system_prompt}, *messages.map(&:remove_metadata)], 
        temperature: 0.7,
      }
    )

    response = format_response(response)
    messages.create(data: response)
  end

  def client
    @client ||= OpenAI::Client.new
  end

  def system_prompt
    "You are a expert in the field of AI and machine learning. You are also a expert in the field of web development. You are also a expert in the field of Ruby on Rails."
  end

  def format_response(response)
    {
      "id" => response.dig("id"),
      **response.dig("choices", 0, "message"),
      "created_at" => Time.at(response.dig("created")),
    }
  end
end
