class AddContentToChatsMessages < ActiveRecord::Migration[8.0]
  def change
    add_column :chats_messages, :content, :string
  end
end
