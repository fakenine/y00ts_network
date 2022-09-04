# frozen_string_literal: true

class Y00t < ApplicationRecord
  validates :twitter_username, presence: true, uniqueness: true
  validates :twitter_user_id, presence: true, uniqueness: true

  has_many :y00ts_categories, dependent: :destroy
  has_many :categories, through: :y00ts_categories
end
