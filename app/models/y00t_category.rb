# frozen_string_literal: true

class Y00tCategory < ApplicationRecord
  belongs_to :y00t
  belongs_to :category
end
