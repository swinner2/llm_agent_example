class AddRoleToChatsMessages < ActiveRecord::Migration[8.0]
  def change
    add_column :chats_messages, :role, :string
  end
end
