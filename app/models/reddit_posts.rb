class RedditPosts < RubyLLM::Tool
  description "get the latest posts from Reddit."

  def execute
    response = HTTParty.get(
      "https://www.reddit.com/.json",
      headers: {
        "Accept" => "application/json",
        "User-Agent" => "My Rails App (https://example.com)"
      }
    )

    JSON.parse(response.body).dig("data", "children").map do |post|
      {
        title: post["data"]["title"],
        url: post["data"]["url"],
        subreddit: post["data"]["subreddit_name_prefixed"],
        author: post["data"]["author"],
        upvotes: post["data"]["ups"],
      }
    end
  rescue => e
    { error: e.message }
  end
end
