# frozen_string_literal: true

class Y00t < ApplicationRecord
  validates :twitter_username, presence: true, uniqueness: true
  validates :twitter_user_id, presence: true, uniqueness: true

  has_many :y00t_categories, dependent: :destroy, foreign_key: :y00t_id
  has_many :categories, through: :y00t_categories

  scope :with_categories, -> (categories_names) { joins(:categories).where(categories: { name: categories_names }) }
end
