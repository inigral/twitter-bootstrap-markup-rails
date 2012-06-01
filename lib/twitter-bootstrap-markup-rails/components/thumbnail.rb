module Twitter::Bootstrap::Markup::Rails::Components
  class Thumbnail < Base
    attr_reader :img_src

    def initialize(img_src, options = {})
      super
      @img_src = img_src
    end

    def to_s
      output_buffer << build_div_or_a_tag do
        html_text = ""
        html_text << build_img_tag
        html_text << build_caption_tag if options[:message] || options[:heading]
      end.html_safe
      super
    end

    private

    def default_options
      {
        :class => 'thumbnail',
        :span => 'span12',
        :link => nil,
        :alt => "",
        :heading => nil,
        :message => nil,
        :html_options => {}
      }
    end

    def build_div_or_a_tag
      class_options = { :class => build_class }

      if options[:message] || options[:heading]
        content_tag(:div, class_options.reverse_merge(options[:html_options]))
      elsif options[:link]
        content_tag(:a, class_options.merge({:href => options[:link]}).reverse_merge(options[:html_options]))
      else
        content_tag(:a, class_options.reverse_merge(options[:html_options]))
      end
    end

    def build_img_tag
      content_tag(:img, { :src => @img_src, :alt => options[:alt] })
    end

    def build_caption_tag
      html_text = ""
      html_text << content_tag(:h5, options[:heading]) if !options[:heading].nil?
      html_text << content_tag(:p, options[:message]) if !options[:message].nil?
      content_tag(:div, { :class => "caption" }, html_text.html_safe)
    end

    def build_class
      classes = [options[:class]]
      classes << options[:html_options][:class] if options[:html_options][:class]
      classes.join(" ")
    end
  end
end
