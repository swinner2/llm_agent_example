class Chats::MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.create!(message_params)
    
    render json: {}, status: :created
  end

  private

  def message_params
    params.require(:chats_message).permit(:content)
  end
end
