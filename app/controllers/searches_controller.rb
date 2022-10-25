# frozen_string_literal: true

# Controller used to search users
class SearchesController < ApplicationController
  include Pagy::Backend

  def index
    @categories = Category.all
    @pagy, @y00ts = pagy(Y00t.all.includes(:categories))
  end
end
