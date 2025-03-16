RubyLLM.configure do |config|
  config.openai_api_key = ENV.fetch("OPENAI_ACCESS_TOKEN")
  # Uncomment these lines if you want to use other providers
  # config.anthropic_api_key = ENV["ANTHROPIC_API_KEY"] if ENV["ANTHROPIC_API_KEY"].present?
  # config.gemini_api_key = ENV["GEMINI_API_KEY"] if ENV["GEMINI_API_KEY"].present?
  # config.deepseek_api_key = ENV["DEEPSEEK_API_KEY"] if ENV["DEEPSEEK_API_KEY"].present?
end