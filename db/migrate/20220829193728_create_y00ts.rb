# frozen_string_literal: true

# Create y00ts table
class CreateY00ts < ActiveRecord::Migration[7.0]
  def change
    create_table :y00ts do |t|
      t.string :twitter_username, index: { unique: true }
      t.string :twitter_user_id, index: { unique: true }
      t.text :twitter_description
      t.string :twitter_profile_image_url
      t.boolean :twitter_verified, default: false

      t.timestamps
    end
  end
end
