module Twitter::Bootstrap::Markup::Rails::Components
  class ThumbnailList < Base
    attr_reader :thumbnails

    def initialize(thumbnails, options = {})
      super
      @thumbnails = thumbnails
    end

    def to_s
      output_buffer << content_tag(:ul, build_class.reverse_merge(options[:html_options]) do
        html_text = ""        

        @thumbnails.each do |t|
          html_text << content_tag(:li, :class => t.options[:span] , t.to_s)
        end

        html_text.html_safe
      end
      super
    end

    private

    def default_options
      {
        :class => 'thumbnails',
        :html_options = {}
      }
    end

    def build_class
      classes => [options[:class]]
      classes << options[:html_options][:class] if options[:html_options][:class]
      classes.join(" ")
    end
  end
end
