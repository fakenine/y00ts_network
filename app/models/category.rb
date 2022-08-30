class Category < ApplicationRecord
  validates :name, presence: true

  has_many :y00ts_categories, dependent: :destroy
  has_many :y00ts, through: :y00ts_categories
end
