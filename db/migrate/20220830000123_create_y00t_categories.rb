# frozen_string_literal: true

# Create y00t_categories table
class CreateY00tCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :y00t_categories do |t|
      t.references :y00t, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
