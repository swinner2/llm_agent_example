class MessagesController < ApplicationController
  def create
    @message = @chat.messages.create!(message_params)
    
    render json: {}, status: :created
  end

  private

  def message_params
    params.require(:chats_message).permit(data: [:role, :content])
  end
end
