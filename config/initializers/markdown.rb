module Haml::Filters

  remove_filter "Markdown"

  module Markdown

    include Haml::Filters::Base

    def render(text)
      (@markdown ||= Redcarpet::Markdown.new Redcarpet::Render::HTML, {
        autolink:         true,
        fenced_code:      true,
        generate_toc:     true,
        gh_blockcode:     true,
        hard_wrap:        true,
        no_intraemphasis: true,
        strikethrough:    true,
        tables:           true,
        xhtml:            true
      }).render text
    end

  end
end