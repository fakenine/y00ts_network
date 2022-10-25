# frozen_string_literal: true

# Controller used to search users
class SearchesController < ApplicationController
  include Pagy::Backend

  def index
    @categories_names = Category.all.map { |cat| { name: cat.name } }
    @categories_query = @categories_names.select { |k, _v| k[:name].in?(params[:query].split(',')) }
                                         .map { |k, v| k[:name] }

    @pagy, @y00ts = pagy(find_y00ts)
  end

  private

  def find_y00ts
    if params[:query].present?
      Y00t.with_categories(params[:query].split(',')).includes(:categories)
    else
      Y00t.all.includes(:categories)
    end
  end
end
