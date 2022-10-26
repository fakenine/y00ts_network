# frozen_string_literal: true

# Controller used to search users
class SearchesController < ApplicationController
  include Pagy::Backend

  def index
    @categories_names = find_categories_names
    @categories_query = parse_categories_query

    @pagy, @y00ts = pagy(find_y00ts)
  end

  private

  def find_y00ts
    if params[:query].present?
      Y00t.with_categories(params[:query].split(',')).includes(:categories).order(created_at: :desc)
    else
      Y00t.all.includes(:categories).order(created_at: :desc)
    end
  end

  def find_categories_names
    Category.all.map { |cat| { name: cat.name } }
  end
  
  def parse_categories_query
    if params[:query].present?
      @categories_names.select { |k, _v| k[:name].in?(params[:query].split(',')) }
                       .map { |k, v| k[:name] }
    end
  end
end
