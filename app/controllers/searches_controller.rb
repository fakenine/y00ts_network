# frozen_string_literal: true

# Controller used to search users
class SearchesController < ApplicationController
  include Pagy::Backend

  def index
    @categories_names = Category.all.map { |cat| { name: cat.name } }

    if params[:query]
      @pagy, @y00ts = pagy(Y00t.with_categories(params[:query].split(',')).includes(:categories))
    else
      @pagy, @y00ts = pagy(Y00t.all.includes(:categories))
    end
  end
end
