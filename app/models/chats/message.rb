class Chats::Message < ApplicationRecord
  self.table_name_prefix = "chats_"
  belongs_to :chat
end
