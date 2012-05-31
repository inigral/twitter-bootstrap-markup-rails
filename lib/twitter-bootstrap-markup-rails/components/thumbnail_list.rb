module Twitter::Bootstrap::Markup::Rails::Components
  class ThumbnailList < Base
    attr_reader :thumbnails

    def initialize(thumbnails, options = {})
      super
      @thumbnails = thumbnails
    end

    def to_s
      output_buffer << content_tag(:ul, { :class => options[:class] }, build_thumbnail_tags).html_safe
      super
    end

    private

    def default_options
      {
        :class => 'thumbnails',
        :html_options = {}
      }
    end

    def build_thumbnail_tags
      html_text = ""
      @thumbnails.each do |thumbnail|
        html_text << content_tag(:li, { :class => thumbnail.options[:span] }, thumbnail)
      end.html_safe
    end
  end
end
