class Chat < ApplicationRecord
  has_many :messages, class_name: "Chats::Message", dependent: :destroy
end
