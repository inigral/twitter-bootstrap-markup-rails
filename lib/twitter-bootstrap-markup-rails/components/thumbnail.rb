module Twitter::Bootstrap::Markup::Rails::Components
  class Thumbnail < Base
    attr_reader :img_src

    def initialize(img_src, options = {})
      super
      @img_src = img_src
    end

    def to_s
      output_buffer << build_main_tag do
        html_text = ""
        html_text << build_img_tag
        html_text << build_caption_tag if !options[:message].nil? || !options[:heading].nil?
      end.html_safe
      super
    end

    private

    def default_options
      {
        :class => 'thumbnail',
        :link => nil,
        :alt => "",
        :heading => nil,
        :message => nil,
        :html_options => {}
      }
    end

    def build_main_tag
      if options[:link].nil?
        build_a_tag
      else
        content_tag(:div, { :class => options[:class] })
      end
    end

    def build_a_tag
      if options[:link].nil?
        content_tag(:a, { :class => options[:class] })
      else
        content_tag(:a, { :href => options[:link], :class => options[:class] })
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
  end
end
