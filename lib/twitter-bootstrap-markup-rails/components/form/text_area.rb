module Twitter::Bootstrap::Markup::Rails::Components
  class Form::TextArea < Form
    attr_accessor :input_html, :label_html

    def initialize(object_name, method, input_html, options = {})
      super(options)
      @input_html = input_html
      @label_html = Label.new(object_name, method, options) if options[:label] || options[:label_text]
    end

    def to_s
      output_buffer << content_tag(:div, :class => 'control-group') do
        html = ''
        html << label_html.to_s
        html << content_tag(:div, :class => 'controls') do
          build_text_area << build_help_text
        end
        html.html_safe
      end
      super
    end

    private

    def build_text_area
      input_html
    end

    def build_help_text
      html = ''
      html = content_tag(:p, options[:help_text], :class => 'help-block') if options[:help_text]
      html.html_safe
    end
  end
end