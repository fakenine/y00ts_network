# frozen_string_literal: true

# Searches view helper methods
module SearchesHelper
  include ::Pagy::Frontend

  def y00t_twitter_image_hd(image_url)
    image_url.gsub('_normal', '')
  end
end
