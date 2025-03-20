module MarkdownHelper
  def markdown_to_html(text)
    return '' if text.blank?
    
    renderer = Redcarpet::Render::HTML.new(
      filter_html: false,
      hard_wrap: true,
      link_attributes: { target: '_blank', rel: 'noopener noreferrer' }
    )
    
    markdown = Redcarpet::Markdown.new(
      renderer,
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      strikethrough: true,
      superscript: true,
      underline: true,
      highlight: true,
      quote: true,
      footnotes: true
    )
    
    markdown.render(text).html_safe
  end
end 