class DadJoke < RubyLLM::Tool
  description "Gets a dad joke"

  def execute
    response = HTTParty.get(
      "https://icanhazdadjoke.com/",
      headers: {
        "Accept" => "application/json",
        "User-Agent" => "My Rails App (https://example.com)"
      }
    )
    JSON.parse(response.body)["joke"]
  rescue => e
    { error: e.message }
  end
end
