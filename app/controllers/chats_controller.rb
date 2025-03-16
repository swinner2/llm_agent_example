class ChatsController < ApplicationController
  def show
    @chat = Chat.find(params[:id])
  end

  def ask
    @chat = Chat.find(params[:id])

    # Use a background job to avoid blocking
    ChatJob.perform_later(@chat.id, params[:message])

    # Let the user know we're working on it
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @chat }
    end
  end
end

