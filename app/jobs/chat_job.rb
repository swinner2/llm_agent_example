class ChatJob < ApplicationJob
  queue_as :default

  def perform(chat_id, message)
    chat = Chat.find(chat_id)
    chat.
      with_tool(DadJoke).
      with_tool(GenerateImage).
      with_tool(RedditPosts).
      with_tool(MovieSearch)
    chat.ask(message)
  end
end
