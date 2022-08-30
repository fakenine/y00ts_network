class CreateY00ts < ActiveRecord::Migration[7.0]
  def change
    create_table :y00ts do |t|
      t.string :twitter_username, index: true, unique: true
      t.bigint :twitter_user_id, index: true, unique: true
      t.text :twitter_bio

      t.timestamps
    end
  end
end
