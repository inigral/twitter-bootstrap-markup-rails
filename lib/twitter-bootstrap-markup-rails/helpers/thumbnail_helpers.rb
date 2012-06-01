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

    def bootstrap_thumbnail_list(thumbnails, options = {})
      Twitter::Bootstrap::Markup::Rails::Components::ThumbnailList.new(
        thumbnails,
        options
      ).to_s
    end
  end
end
