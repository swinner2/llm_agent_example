class ChatJob < ApplicationJob
  queue_as :default

  def perform(chat_id, message)
    chat = Chat.find(chat_id)

    # Start with a "typing" indicator
    Turbo::StreamsChannel.broadcast_append_to(
      chat,
      target: "messages",
      partial: "messages/typing"
    )

    chat.ask(message)
  end
end
