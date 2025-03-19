class GenerateImage < RubyLLM::Tool
  description "Use this tool with a prompt to generate or take a photo of anything."

  param :prompt, 
    type: :string, 
    desc: "The prompt to use to generate an image or take a photo.",
    required: true

  def execute(prompt:)
    image = RubyLLM.paint(prompt)
    image.url
  rescue => e
    { error: e.message }
  end
end
