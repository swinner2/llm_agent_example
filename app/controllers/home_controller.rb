class HomeController < ApplicationController
  def index
    @chat = Chat.first_or_create(model_id: "gpt-4o-mini")
  end
end