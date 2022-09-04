# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true

  has_many :y00t_categories, dependent: :destroy
  has_many :y00ts, through: :y00t_categories
end
