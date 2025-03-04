class HomeController < ApplicationController
  def index
    @chat = Chat.first
  end
end
