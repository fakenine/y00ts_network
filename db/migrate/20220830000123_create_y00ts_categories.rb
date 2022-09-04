# frozen_string_literal: true

class CreateY00tsCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :y00ts_categories do |t|
      t.references :y00ts, null: false, foreign_key: true
      t.references :categories, null: false, foreign_key: true

      t.timestamps
    end
  end
end
