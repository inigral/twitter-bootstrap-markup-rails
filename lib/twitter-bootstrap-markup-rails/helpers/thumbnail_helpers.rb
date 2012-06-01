module Twitter::Bootstrap::Markup::Rails::Helpers
  module ThumbnailHelpers
    # Renders a thumbnail
    #
    # @param [String] img url for the image to be displayed
    # @param [Hash] options hash containing options (default: {}):
    #           :link         - The String link when image is clicked
    #           :alt          - The String text when image is moused over
    #           :heading      - The String heading message to render
    #           :message      - The String content message to render
    #           :html_options - Any additional HTML options desired on the thumbnail DIV.
    #
    # Examples
    #
    #   bootstrap_thumbnail("imgs/fluffy_cat")
    #   # => '<a class="thumbnail"'
    #
    # Returns HTML String for the alert
    def bootstrap_thumbnail(img_url, options = {})
      Twitter::Bootstrap::Markup::Rails::Components::Thumbnail.new(
        img_url,
        options
      ).to_s
    end

    # Renders a thumbnail list
    #
    # @param [Hash] options hash containing options (default: {}):
    #
    # Examples
    #
    #   bootstrap_thumbnail_list do |e|
    #     e.bootstrap_thumbnail "imgs/fluffy_cat.jpg"
    #     e.bootstrap_thumbnail "imgs/scruffy_cat.jpg"
    #   end
    #
    # Returns HTML String for the list
    #
    def bootstrap_button_dropdown(options = {})
      # Elements will hold every call made to this block. Self is passed in so the
      # elements can be sent to it in order to be evaluated
      thumbnails = Twitter::Bootstrap::Markup::Rails::HelperCollection.new(self)

      yield thumbnails
      Twitter::Bootstrap::Markup::Rails::Components::ThumbnailList.new(
        thumbnails,
        options
      ).to_s
    end
  end
end
