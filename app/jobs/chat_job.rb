class ChatJob < ApplicationJob
  queue_as :default

  def perform(chat_id, message)
    chat = Chat.find(chat_id)
    chat.with_tool(DadJoke)
    chat.ask(message)
  end
end
