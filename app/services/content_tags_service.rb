require 'singleton'

class ContentTagsService
  include Singleton

  Allowed_tags = %w(strong i em s span h1 h2 h3 h4 h5 h6)
  Allowed_attributes = %w(class href)

  def initialize
    @content_tags = ContentTag.all

    @opening_tags = []
    @closing_tags = []

    @content_tags.each do |ct|
      @opening_tags[ct.id] = ct.html.html_safe
      @closing_tags[ct.id] = get_closing_tags(ct.html).html_safe
    end
  end

  def parse_content_tags(text)
    text.gsub!(/\[#(\d+)\]/) { @opening_tags[$1.to_i] }
    text.gsub!(/\[\/#(\d+)\]/) { @closing_tags[$1.to_i] }

    text
  end

  def get_closing_tags(opening_tags)
    # handle hrefs first
    # todo

    # remove attributes
    opening_tags.gsub!(/\s\w+=['"](\w|\d|\s|-|#|:|;)+['"]/, '')

    # captures tags and revese them
    opening_tags = opening_tags.scan(/<\w+>/).reverse.join

    # add closing slash
    opening_tags.gsub(/</, '</')
  end
end
