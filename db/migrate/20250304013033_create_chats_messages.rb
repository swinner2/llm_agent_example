class CreateChatsMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :chats_messages do |t|
      t.references :chat, null: false, foreign_key: true
      t.json :data

      t.timestamps
    end
  end
end
