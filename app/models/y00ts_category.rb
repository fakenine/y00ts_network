# frozen_string_literal: true

class Y00tsCategory < ApplicationRecord
  belongs_to :y00ts
  belongs_to :categories
end
